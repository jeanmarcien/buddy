# Pin npm packages by running ./bin/importmap
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true

pin "flatpickr", to: "https://ga.jspm.io/npm:flatpickr@4.6.13/dist/esm/index.js"

# Chart.js et ses dépendances
pin "chart.js/auto", to: "https://ga.jspm.io/npm:chart.js@4.4.1/auto/auto.js"
pin "@kurkle/color", to: "https://ga.jspm.io/npm:@kurkle/color@0.3.2/dist/color.esm.js"


pin "@fullcalendar/core", to: "https://unpkg.com/@fullcalendar/core@6.1.10/index.global.min.js"
pin "@fullcalendar/daygrid", to: "https://unpkg.com/@fullcalendar/daygrid@6.1.10/index.global.min.js"
pin "@fullcalendar/interaction", to: "https://unpkg.com/@fullcalendar/interaction@6.1.10/index.global.min.js"
pin "@fullcalendar/timegrid", to: "https://unpkg.com/@fullcalendar/timegrid@6.1.10/index.global.min.js"
pin "@fullcalendar/list", to: "https://unpkg.com/@fullcalendar/list@6.1.10/index.global.min.js"


pin_all_from "app/javascript/controllers", under: "controllers"