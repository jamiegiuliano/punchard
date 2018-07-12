function Link(data) {
  this.id = data.id;
  this.url = data.url;
  this.merchant_id = data.merchant_id;
  this.category = data.category;
}

Link.prototype.buildLinks = function() {
  let output = `<li class="collection-item"><a href="${this.url}" target="_blank" hidden_field="${this.id}">${this.category.name}</a>
                  <a href="/merchants/${this.merchant_id}/links/${this.id}/edit"><i class="tiny material-icons">edit</i></a>
                  <a data-confirm="Are you sure?" data-method="delete" href="/merchants/${this.merchant_id}/links/${this.id}"><i class="tiny material-icons">delete_forever</i></a>`;
  return output;
}
