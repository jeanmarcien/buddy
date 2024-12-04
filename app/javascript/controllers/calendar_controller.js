// app/javascript/controllers/calendar_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    document.addEventListener("DOMContentLoaded", () => {
      const calendarEl = this.element;
      const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: "dayGridMonth",
        headerToolbar: {
          left: "prev,next today",
          center: "title",
          right: "dayGridMonth,timeGridWeek,listWeek",
        },
        selectable: true,
        editable: true,
        firstDay: 1,
        locale: "fr",
        buttonText: {
          today: "Aujourd'hui",
          month: "Mois",
          week: "Semaine",
          list: "Liste",
        },
      });

      calendar.render();
      this.calendar = calendar;
    });
  }

  disconnect() {
    if (this.calendar) {
      this.calendar.destroy();
    }
  }
}
