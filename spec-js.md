# Specifications for the Rails with jQuery Assessment

Specs:
- [X] Use jQuery for implementing new requirements
- [X] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  * From the User's homepage, an individual Merchant's show page can be viewed by clicking the 'pageview' button on the merchant index. From this merchant's show page, a User can click the 'next' button on the bottom of the page to render the next merchant's show page via Ajax.

- [X] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  * The 'Show Merchants' button on the User's index page triggers and event listener, which creates a jQuery 'get' request. The JSON response includes the current user's merchant index, iterates through the data, creates Merchant Model Objects from a Merchant constructor function. A prototype function is then called on the merchant instance and formats the html, which is then added to the DOM.

- [X] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  * On a merchant's show page that has been rendered via Ajax, a list of links is rendered via JSON and appended to the DOM (a merchant has_many :links). In a merchant's AR Serializer, the has_many :links relationship has been included so that the link's information will be rendered and included in the JSON response.

- [X] Use your Rails API and a form to create a resource and render the response without a page refresh.
  * When a User clicks on a specific merchant's show page from the homepage index, there is a form to create a new link. When this form is submitted, the event is hijacked through an event listener, which triggers an Ajax 'post' request. If successful, this request responds with the newly created JSON object, which is formatted into a Link Model Object and a prototype function is called on the model object to format the html and then is appended to the DOM.

- [X] Translate JSON responses into js model objects.
  * JSON responses are translated into JS model objects in every jQuery/Ajax request, for both Links and Merchants.

- [X] At least one of the js model objects must have at least one method added by your code to the prototype.
  * The Merchant model object has two methods added to the prototype and the Link model object has one method.

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
