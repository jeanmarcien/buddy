// app/javascript/controllers/calendar_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const calendar = new FullCalendar.Calendar(this.element, {
      initialView: "dayGridMonth",
      headerToolbar: {
        left: "prev,next today",
        center: "title",
        right: "dayGridMonth,timeGridWeek,listWeek",
      },
      selectable: true,
      editable: false,
      firstDay: 1,
      locale: "en",
      events: "/calendar_events",
      eventClick: this.handleEventClick.bind(this),
      eventDidMount: (info) => {
        info.el.title = `Renewal for: ${info.event.title}
Date: ${new Date(info.event.start).toLocaleDateString("en-US")}`;
      },
      buttonText: {
        today: "Today",
        month: "Month",
        week: "Week",
        list: "List",
      },
    });
    calendar.render();
    this.calendar = calendar;
  }

  disconnect() {
    if (this.calendar) {
      this.calendar.destroy();
    }
  }

  handleEventClick(info) {
    const treatmentId = info.event.extendedProps.treatment_id;
    const petId = info.event.extendedProps.pet_id;

    fetch(`/pets/${petId}/treatments/${treatmentId}/details`)
      .then((response) => response.json())
      .then((data) => {
        const modalBody = document.getElementById("treatmentModalBody");
        modalBody.innerHTML = `
		  <div class="container">
			<div class="row mb-2">
			  <div class="col-4"><strong>Treatment Name:</strong></div>
			  <div class="col-8">${data.name}</div>
			</div>
			<div class="row mb-2">
			  <div class="col-4"><strong>Type:</strong></div>
			  <div class="col-8">${data.treatment_type}</div>
			</div>
			<div class="row mb-2">
			  <div class="col-4"><strong>Start Date:</strong></div>
			  <div class="col-8">${new Date(data.start_date).toLocaleDateString(
          "en-US"
        )}</div>
			</div>
			<div class="row mb-2">
			  <div class="col-4"><strong>End Date:</strong></div>
			  <div class="col-8">${new Date(data.end_date).toLocaleDateString(
          "en-US"
        )}</div>
			</div>
			<div class="row mb-2">
			  <div class="col-4"><strong>Dosage:</strong></div>
			  <div class="col-8">${data.dosage || "Not specified"}</div>
			</div>
			<div class="row mb-2">
			  <div class="col-4"><strong>Frequency:</strong></div>
			  <div class="col-8">${data.frequency || "Not specified"}</div>
			</div>
			<div class="row mb-2">
			  <div class="col-4"><strong>Renewal Date:</strong></div>
			  <div class="col-8">${new Date(data.renew_date).toLocaleDateString(
          "en-US"
        )}</div>
			</div>
			<div class="row mb-2">
			  <div class="col-4"><strong>Reminders:</strong></div>
			  <div class="col-8">${data.reminders ? data.reminders.join(", ") : "No reminders set"}</div>
			</div>
			${
        data.notes
          ? `
			  <div class="row mt-3">
				<div class="col-12">
				  <div class="alert alert-info">
					<strong>Notes:</strong><br>
					${data.notes}
				  </div>
				</div>
			  </div>
			`
          : ""
      }
			<div class="row mt-3">
			  <div class="col-12 text-end">
				<a href="/pets/${petId}/treatments/${treatmentId}/edit" 
				   class="btn btn-primary btn-sm">
				   Edit Treatment
				</a>
			  </div>
			</div>
		  </div>
		`;

        // Utiliser Bootstrap depuis l'objet global
        const modalElement = document.getElementById("treatmentModal");
        const modal = new bootstrap.Modal(modalElement);
        modal.show();
      })
      .catch((error) => {
        console.error("Error:", error);
        alert("Error loading treatment details. Please try again.");
      });
  }

  refreshEvents() {
    this.calendar.refetchEvents();
  }
}
