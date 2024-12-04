// app/javascript/controllers/calendar_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    document.addEventListener("DOMContentLoaded", () => {
      const calendarEl = this.element;
      const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: window.innerWidth < 768 ? "timeGridDay" : "dayGridMonth",
        headerToolbar: {
          left: "prev,next today",
          center: "title",
          right: "dayGridMonth,timeGridWeek,timeGridDay",
        },
        selectable: true,
        editable: true,
        firstDay: 1,
        locale: "fr",
        height: "auto",
        contentHeight: "auto",
        handleWindowResize: true,
        windowResizeDelay: 200,
        // Configuration responsive
        windowResize: function (view) {
          if (window.innerWidth < 768) {
            calendar.changeView("timeGridDay");
          } else {
            calendar.changeView("dayGridMonth");
          }
        },
        // Personnalisation des en-têtes selon la taille
        views: {
          dayGridMonth: {
            titleFormat: { year: "numeric", month: "long" },
          },
          timeGridWeek: {
            titleFormat: { year: "numeric", month: "long", day: "2-digit" },
            dayHeaderFormat: { weekday: "short", day: "2-digit" },
          },
          timeGridDay: {
            titleFormat: { year: "numeric", month: "long", day: "2-digit" },
            dayHeaderFormat: { weekday: "long", day: "2-digit" },
          },
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
