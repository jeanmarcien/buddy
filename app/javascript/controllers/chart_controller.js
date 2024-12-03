import { Controller } from "@hotwired/stimulus";
import Chart from "chart.js/auto"; // Changé ici

export default class extends Controller {
  static targets = ["canvas"];

  connect() {
    const ctx = this.canvasTarget;
    new Chart(ctx, {
      type: "line",
      data: JSON.parse(this.element.dataset.chartData),
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true,
          },
        },
      },
    });
  }
}
