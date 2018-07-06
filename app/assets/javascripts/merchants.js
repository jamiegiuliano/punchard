//////// Event Listeners //////
$(function showMerchants() {
  $(".js-merchant-index").on("click", function(e) {
    e.preventDefault();
    getMerchantList();
  });
})

/////// AJAX Calls //////
const getMerchantList = function() {
  $.get("/merchants.json", function(response) {
    debugger
    var names = response.map(merchant => merchant.name)
    names.forEach(function(name){
      $('.all-merchants li').append(`
        <div>${name}</div>
      `);
    })

  });
}
