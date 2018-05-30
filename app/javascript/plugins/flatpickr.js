import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

  // flatpickr(".datepicker", {})
  flatpickr("#project_start_date", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#project_end_date"})]
  });

