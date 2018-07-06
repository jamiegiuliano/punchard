function Merchant(data) {
  this.id = data.id;
  this.name = data.name;
  this.location = data.location;
  this.image = data.image;
}

//Merchant.prototype.buildMerchantsList = function() {

//}

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
    $.each(response, function(index, value) {
      debugger
    })
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
