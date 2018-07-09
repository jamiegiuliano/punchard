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
    <div class="merchant_links">`;

    <ul>
      <li><a href="${response.url}" target="_blank" hidden_field="${response.id}">${response.category.name}</a>

      <a href="/merchants/${response.merchant_id}/links/${response.id}/edit"><i class="material-icons">edit</i></a>
      <a data-confirm="Are you sure?" data-method="delete" href="/merchants/${response.merchant_id}/links/${response.id}"><i class="material-icons">delete_forever</i></a>
      </li>
    </ul>

    output += `
    </div>
    </div>

    <div class="link_form right form">
    <strong>Add another link!</strong>

    <form class="new_link" id="new_link" action="/merchants/${this.id}/links" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="1CJ2PxkAE1MXr5KF8bPVj/X83MgEGoXQ9J2Hl+8HNyvK/m1c5QNDhp9K+mJ/sAI1yObT5zmO1BdbqZ3lYWT1iw==">
      <label for="link_url" class="active">URL:</label>
      <input placeholder="https://squareup.com/" type="text" name="link[url]" id="link_url">

      <input type="hidden" value="${this.id}" name="link[merchant_id]" id="link_merchant_id">

      <div class="input-field">
      <div class="select-wrapper initialized"><span class="caret">▼</span><input type="text" class="select-dropdown" readonly="true" data-activates="select-options-ee273646-d230-a880-ed13-dc8af435c293" value="Loyalty Profile"><ul id="select-options-ee273646-d230-a880-ed13-dc8af435c293" class="dropdown-content select-dropdown "><li class=""><span>Loyalty Profile</span></li><li class=""><span>Reward</span></li><li class=""><span>Receipt</span></li></ul><select name="link[category_attributes][name]" id="link_category_attributes_name" data-select-id="ee273646-d230-a880-ed13-dc8af435c293" class="initialized"><option value="Loyalty Profile">Loyalty Profile</option>
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
    </script>

    </div>
    <a href="#" class="js-next center" data-id="<%=${this.id}%>">Next...</a>
  </div>`;
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
    debugger
    const merchant = new Merchant(response);
    const html = merchant.buildMerchantShowPage();
    $('.merchant-show').html(html);
  });
}
