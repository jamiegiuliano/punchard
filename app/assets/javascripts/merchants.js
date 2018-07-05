//////// Event Listeners //////
$(function showMerchants() {
  $(".js-merchant-index").on("click", function(e) {
    e.preventDefault();
    getMerchantList(this.href);
  });
})

/////// AJAX Calls //////
const getMerchantList = function(url){
  $.get(url).done(function(response) {
    $('.all-merchants').html(response);
  });
}
