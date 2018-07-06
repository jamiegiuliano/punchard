function Merchant(data) {
  this.id = data.id;
  this.name = data.name;
  this.location = data.location;
  this.image = data.image;
  this.links = data.links
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

//////// Event Listeners //////
$(function showMerchants() {
  $(".js-merchant-index").on("click", function(e) {
    e.preventDefault();
    getMerchantList();
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

//const getMerchantList = $.get("/merchants.json", function(response) {
//    var names = response.map(merchant => merchant.name)
//    names.forEach(function(name){
//      $('.all-merchants li').append(`
//        <div>${name}</div>
//      `);
//    });
//  });
