import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="expandable"
export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.content = this.element.querySelector(".video-content");
    this.button = this.element.querySelector(".expand-button");
    this.content.style.maxHeight = "0";
    this.content.style.overflow = "hidden";
  }

  toggle() {
    if (
      this.content.style.maxHeight === "0px" ||
      !this.content.style.maxHeight
    ) {
      this.content.style.maxHeight = "600px";
      this.button.textContent = "Collapse";
    } else {
      this.content.style.maxHeight = "0";
      this.button.textContent = "Expand";
    }
  }
}
