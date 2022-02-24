import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox"]

  checkAll(event) {
    console.log(event);
    if (event.target.checked === true) {
      this.checkboxTargets.forEach((element) => {
        element.checked = true;
      });
    } else {
      this.checkboxTargets.forEach((element) => {
        element.checked = false;
      });
    }
  }
}
