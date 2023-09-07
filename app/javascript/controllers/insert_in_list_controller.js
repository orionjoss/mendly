import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]

  send(e) {
    e.preventDefault()
    const url = this.formTarget.action

    fetch(url, {
      method: "POST",
      headers: {
        "Accept": "application/json",
      },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => console.log(data))
  }
}

// PSEUDO CODE:
// refactor the show view from to a partial (only a message)
// extend the response of your controller to a json and html (it will send a json file create.json.jbuilder)
// add the partial
// add the data within the dom with insertAdjacentHTML
// clean the form
