import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      dateFormat: "Y-m-d",
      allowInput: true,
      minDate: "2000-01-01", // Remove maxDate to allow future dates
    });
  }
}
