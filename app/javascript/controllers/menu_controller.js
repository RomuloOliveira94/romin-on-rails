import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu", "burgerButton", "closeButton"];

  connect() {
    this.menuTarget.classList.add("hidden");
    this.closeButtonTarget.classList.add("hidden");
  }

  toggle() {
    const menu = this.menuTarget;
    const burger = this.burgerButtonTarget;
    const close = this.closeButtonTarget;

    if (menu.classList.contains("hidden")) {
      menu.classList.remove("hidden");
      burger.classList.add("hidden");
      close.classList.remove("hidden");
    } else {
      menu.classList.add("hidden");
      burger.classList.remove("hidden");
      close.classList.add("hidden");
    }
  }
}
