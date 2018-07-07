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

$(function filterMerchants() {
  $('#merchants_filter').submit(function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
});

//$(function filterMerchants() {
//  $('.merchants_filter').on("click", function(e) {
//    e.preventDefault();
//    const location = $('.active')[0].innerText;
//    filterMerchantList(location);
//  })
//})

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

//const filterMerchantList = function(location) {
//  var url = '/merchants.json?utf8=✓&location='+ location.split(',')[0] + '%2C+'+location.split(',')[1] + '&commit=Filter'.replace(/\s/g, '');
//  url = url.replace(/\s/g, '');
//  $.get(url).done(function(response) {
//    let merchants = '';
//    $.each(response, function(index, value) {
//      const merchant = new Merchant(value);
//      merchants += merchant.buildMerchantsList();
//    });
//    $('.all-merchants li').html(merchants);
//  });
//}
