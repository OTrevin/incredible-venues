// First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
// import flatpickr from "flatpickr";
// import "flatpickr/dist/flatpickr.css";
// Check that the query selector id matches the one you put around your form.
const startDateInput = document.getElementById("search_start_date");
const endDateInput = document.getElementById("search_end_date");

const searchDatePickr = () => {
  // setTimeout(() => console.log("Hello"), 1000);
  if (startDateInput) {
    // console.log("plsss");
    endDateInput.disabled = true;

    flatpickr(startDateInput, {
      minDate: "today",
      dateFormat: "Y-m-d",
    });

    startDateInput.addEventListener("change", (e) => {
      if (startDateInput != "") {
        endDateInput.disabled = false;
      }
      flatpickr(endDateInput, {
        minDate: e.target.value,
        dateFormat: "Y-m-d",
      });
    });
  }
};

export { searchDatePickr };
