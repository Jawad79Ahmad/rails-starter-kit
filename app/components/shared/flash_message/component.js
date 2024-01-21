import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"];

  connect() {
  }

  init() {
    setTimeout(() => {
      this.close();
    }, 5000);
  }

  close() {
    this.element.remove();
  }
}
