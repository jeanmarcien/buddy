// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "@popperjs/core";
import "bootstrap";

document.addEventListener("click", (event) => {
  const menu = document.getElementById("navbarNav");
  const burger = document.querySelector(".navbar-toggler");

  if (
    menu.classList.contains("show") &&
    !menu.contains(event.target) &&
    !burger.contains(event.target)
  ) {
    burger.click();
  }
});
