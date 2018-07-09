function Merchant(data) {
  this.id = data.id;
  this.name = data.name;
  this.location = data.location;
  this.image = data.image;
  this.star_count = data.star_count;
  this.links = data.links;
  this.categories = data.categories;
}

Merchant.prototype.buildMerchantsList = function() {
  let output = `
  <div class="collection-item avatar">
    <span>
    <img alt="Icon" class="circle" src="${this.image}" />
      <span class="title"><a href="${this.links[0].url}" target="_blank">${this.name}</a></span>
      <a class="right" href="/merchants/${this.id}"><i class="material-icons show-icon">pageview</i></a>
        <p>
          <a href="/merchants/${this.id}/edit"><i class="material-icons">edit</i></a>
          <a data-confirm="Are you sure?" data-method="delete" href="/merchants/${this.id}"><i class="material-icons">delete_forever</i></a>
        </p>
      </span>
  </div>`;
  return output;
}

Merchant.prototype.buildMerchantShowPage = function() {
  let output = '';
  let merchantCats = this.categories;
  output += `
  <div class="container center merchant-show">
    <div class="row">

    <span class="merchant-show">
    <div class="left">
    <img alt="Icon" class="circle" src="${this.image}" /><br />
    <h4>${this.name}</h4>
    Location: ${this.location}<br />
    Total Stars: ${this.star_count}<br />
    <br />
    <div class="divider"></div><br />
    <div class="merchant_links">
    <ul>`;
    $.each(this.links, function(index, value) {
      output += `<li><a href="${value.url}" target="_blank" hidden_field="${value.id}">${merchantCats[index].name}</a>
      <a href="/merchants/${value.merchant_id}/links/${value.id}/edit"><i class="material-icons">edit</i></a>
      <a data-confirm="Are you sure?" data-method="delete" href="/merchants/${value.merchant_id}/links/${value.id}"><i class="material-icons">delete_forever</i></a></li>`;
    });
    output += `</div>
              </div>
              <div class="link_form right form">
              <strong>Add another link!</strong>
            <form class="new_link" id="new_link" action="/merchants/4/links" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓">
                <label for="link_url">URL:</label>
                <input placeholder="https://squareup.com/" type="text" name="link[url]" id="link_url">

                <input type="hidden" value="4" name="link[merchant_id]" id="link_merchant_id">

                <div class="input-field">

                <div class="select-wrapper initialized"><span class="caret">▼</span><input type="text" class="select-dropdown" readonly="true" data-activates="select-options-dedcf2ea-a91d-3b8f-2bc4-c10d107fc746" value="Loyalty Profile"><ul id="select-options-dedcf2ea-a91d-3b8f-2bc4-c10d107fc746" class="dropdown-content select-dropdown "><li class=""><span>Loyalty Profile</span></li><li class=""><span>Reward</span></li><li class=""><span>Receipt</span></li></ul><select name="link[category_attributes][name]" id="link_category_attributes_name" data-select-id="dedcf2ea-a91d-3b8f-2bc4-c10d107fc746" class="initialized"><option value="Loyalty Profile">Loyalty Profile</option>
                <option value="Reward">Reward</option>
                <option value="Receipt">Receipt</option></select></div>
                </div>

                <input type="submit" name="commit" value="Create Link" class="btn-small" data-disable-with="Create Link">
                </form>
                </div>
                </span>
                <script type="text/javascript" charset="utf-8">
                $(document).ready(function() {
                 $('select').material_select();
                });
                </script>`;
    return output;
  }


//////// Event Listeners //////
$(function showMerchants() {
  $(".js-merchant-index").on("click", function(e) {
    e.preventDefault();
    getMerchantList();
  });
})

$(function filterMerchants() {
  $('#merchants_filter').submit(function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
})

$(function paginateMerchants() {
  $('.js-next').on("click", function(e) {
    e.preventDefault();
    getNextMerchant(parseInt(this.dataset.id));
  });
})

/////// AJAX Calls //////
const getMerchantList = function() {
  $.get('/merchants.json').done(function(response) {
    let merchants = '';
    $.each(response, function(index, value) {
      const merchant = new Merchant(value);
      merchants += merchant.buildMerchantsList();
    });
    $('.all-merchants li').html(merchants);
  });
}

const getNextMerchant = function(currentId) {
  nextId = currentId + 1;
  $.get('/merchants/' + nextId + '.json').done(function(response) {
    const merchant = new Merchant(response);
    const html = merchant.buildMerchantShowPage();
    $('.merchant-show').html(html);
  });
}
