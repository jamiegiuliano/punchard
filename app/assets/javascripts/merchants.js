//////// Event Listeners //////
 $(function() {
   $("a.js-merchant-index").on("click", function(e) {
     e.preventDefault();
     getMerchantList(this.href);
   });
})

/////// AJAX Calls //////
const getMerchantList = function(url){
  $.get(url).done(function(response) {
    alert("You've made it!");
    console.log(response)
  });
}
