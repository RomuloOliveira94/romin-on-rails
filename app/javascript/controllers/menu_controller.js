import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu", "burgerButton", "closeButton"];

  connect() {
    this.checkWindowWidth();
    this.closeButtonTarget.classList.add("simple-nav-bar-hidden");
    window.addEventListener("resize", () => this.watchWindowWidth());
  }

  isMobile() {
    return window.innerWidth < 1024;
  }

  watchWindowWidth() {
    if (this.isMobile()) {
      this.menuTarget.classList.add("simple-nav-bar-hidden");
      this.burgerButtonTarget.classList.remove("simple-nav-bar-hidden");
      this.closeButtonTarget.classList.add("simple-nav-bar-hidden");
    } else {
      this.menuTarget.classList.remove("simple-nav-bar-hidden");
      this.burgerButtonTarget.classList.add("simple-nav-bar-hidden");
      this.closeButtonTarget.classList.add("simple-nav-bar-hidden");
    }
  }

  checkWindowWidth() {
    if (this.isMobile()) {
      this.menuTarget.classList.add("simple-nav-bar-hidden");
      this.burgerButtonTarget.classList.remove("simple-nav-bar-hidden");
      this.closeButtonTarget.classList.add("simple-nav-bar-hidden");
    }
  }

  toggle() {
    const menu = this.menuTarget;
    const burger = this.burgerButtonTarget;
    const close = this.closeButtonTarget;

    menu.classList.toggle("simple-nav-bar-hidden");
    burger.classList.toggle("simple-nav-bar-hidden");
    close.classList.toggle("simple-nav-bar-hidden");
  }
}
