import { Controller } from "@hotwired/stimulus";
import Chart from "chart.js/auto";

export default class extends Controller {
  static targets = ["canvas"];

  connect() {
    const ctx = this.canvasTarget;
    const rawData = JSON.parse(this.element.dataset.chartData);

    // On réorganise les données
    const chartData = {
      // On inverse les labels (dates)
      labels: [...rawData.labels].reverse(),
      datasets: rawData.datasets.map((dataset) => ({
        ...dataset,
        // On inverse les données tout en gardant les autres propriétés du dataset
        data: [...dataset.data].reverse(),
        borderColor: dataset.borderColor || "rgb(75, 192, 192)",
        tension: 0.1,
      })),
    };

    new Chart(ctx, {
      type: "line",
      data: chartData,
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true,
          },
          x: {
            reverse: false, // Assure l'ordre chronologique
          },
        },
      },
    });
  }
}
