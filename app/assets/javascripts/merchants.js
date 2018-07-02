//////// Event Listeners //////
 $(function() {
   $("a.js-merchant-index").on("click", function(e) {
     getMerchantList(this.href);
     e.preventDefault();
   });
})

/////// AJAX Calls //////
const getMerchantList = function(url){
  $.get(url).done(function(response) {
    $('.collection').append(response);
  });
}
