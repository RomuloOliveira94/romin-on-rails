class MenuController {
  constructor() {
    this.menu = document.querySelector(".simple-nav-bar-nav-list-container");
    this.burgerButton = document.querySelector(".simple-nav-bar-burger-button");
    this.closeButton = document.querySelector(".simple-nav-bar-close-button");

    this.toggle = this.toggle.bind(this);
    this.checkWindowWidth = this.checkWindowWidth.bind(this);

    this.burgerButton.addEventListener("click", this.toggle);
    this.closeButton.addEventListener("click", this.toggle);
    window.addEventListener("resize", this.checkWindowWidth);

    this.init();
  }

  isMobile() {
    return window.innerWidth < 1024;
  }

  init() {
    if (this.isMobile()) {
      this.menu.classList.add("simple-nav-bar-hidden");
      this.burgerButton.classList.remove("simple-nav-bar-hidden");
      this.closeButton.classList.add("simple-nav-bar-hidden");
    }
  }

  checkWindowWidth() {
    if (this.isMobile()) {
      this.menu.classList.add("simple-nav-bar-hidden");
      this.burgerButton.classList.remove("simple-nav-bar-hidden");
      this.closeButton.classList.add("simple-nav-bar-hidden");
    } else {
      this.menu.classList.remove("simple-nav-bar-hidden");
      this.burgerButton.classList.add("simple-nav-bar-hidden");
      this.closeButton.classList.add("simple-nav-bar-hidden");
    }
  }

  toggle() {
    this.menu.classList.toggle("simple-nav-bar-hidden");
    this.burgerButton.classList.toggle("simple-nav-bar-hidden");
    this.closeButton.classList.toggle("simple-nav-bar-hidden");
  }
}

document.addEventListener("DOMContentLoaded", () => {
  new MenuController();
});
