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
  let auth_token = $('meta[name=csrf-token]').attr('content');
  output += `
  <div class="container center merchant-show">
    <div class="row">
      <span class="merchant-show">
        <div class="left main-merchant">
          <img alt="Icon" class="circle" src="${this.image}" /><br />
          <h4>${this.name}</h4>
          Location: ${this.location}<br />
          Total Stars: ${this.star_count}<br />
          <br />
          <div class="divider"></div><br />
            <div class="merchant_links collection">
              <ul id="link_list" class="collection">`;
    $.each(this.links, function(index, value) {
      output += `<li class="collection-item"><a href="${value.url}" target="_blank" hidden_field="${value.id}">${merchantCats[index].name}</a>
                      <a href="/merchants/${value.merchant_id}/links/${value.id}/edit"><i class="tiny material-icons">edit</i></a>
                      <a data-confirm="Are you sure?" data-method="delete" href="/merchants/${value.merchant_id}/links/${value.id}"><i class="tiny material-icons">delete_forever</i></a>
                </li>
                `;
    });
    output += `</div>
              </div>
              <div class="link_form right form">
                <strong>Add another link!</strong>
                <form class="new_link" id="new_link" action="/merchants/${this.id}/links" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="${auth_token}">
                  <label for="link_url">URL:</label>
                  <input placeholder="https://squareup.com/" type="text" name="link[url]" id="link_url">

                  <input type="hidden" value="${this.id}" name="link[merchant_id]" id="link_merchant_id">

                  <div class="input-field">

                  <div class="select-wrapper initialized"><span class="caret">▼</span><input type="text" class="select-dropdown" readonly="true" data-activates="select-options-dedcf2ea-a91d-3b8f-2bc4-c10d107fc746" value="Loyalty Profile"><ul id="select-options-dedcf2ea-a91d-3b8f-2bc4-c10d107fc746" class="dropdown-content select-dropdown "><li class=""><span>Loyalty Profile</span></li><li class=""><span>Reward</span></li><li class=""><span>Receipt</span></li></ul><select name="link[category_attributes][name]" id="link_category_attributes_name" data-select-id="dedcf2ea-a91d-3b8f-2bc4-c10d107fc746" class="initialized"><option value="Loyalty Profile">Loyalty Profile</option>
                  <option value="Reward">Reward</option>
                  <option value="Receipt">Receipt</option></select></div>
                  </div>

                  <input type="submit" name="commit" value="Create Link" class="btn-small create-link" data-disable-with="Create Link">
                  </form>
                </div>
              </span>
            </div>
          </div>
          <a class="btn-floating btn-medium waves-effect waves-light grey js-next" data-id="${this.id}"><i class="small material-icons">arrow_forward</i></a>
        </div>
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

$(function newLink() {
  $('form#new_link').on("submit", function(e) {
    e.preventDefault();
    const values = $(this).serialize();
    const action = this.action;
    createNewLink(values, action);
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
    $('.merchant-show').empty(); // smoother transition
    $('.merchant-show').html(html);
    // reattach Listener for Materialize Select
    $(document).ready(function() {
      $(this).find('select').material_select();
      // reattach Listerner for 'next'
      $('.js-next').on("click", function(e) {
        e.preventDefault();
        getNextMerchant(parseInt(this.dataset.id));
      });
    });
  });
}

const createNewLink = function(values, action){
  $.ajax({
    url: action,
    type: 'POST',
    data: values,
    dataType: 'JSON',
    success: function(data) {
      let output = `<li class="collection-item"><a href="${data.url}" target="_blank" hidden_field="${data.id}">${data.category.name}</a>
                      <a href="/merchants/${data.merchant_id}/links/${data.id}/edit"><i class="tiny material-icons">edit</i></a>
                      <a data-confirm="Are you sure?" data-method="delete" href="/merchants/${data.merchant_id}/links/${data.id}"><i class="tiny material-icons">delete_forever</i></a>

                `;
      $('#link_list').append(output);
    }
  });
}
