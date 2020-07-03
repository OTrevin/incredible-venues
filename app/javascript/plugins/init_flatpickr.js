// First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
// import flatpickr from "flatpickr";
// import "flatpickr/dist/flatpickr.css";
// Check that the query selector id matches the one you put around your form.
const startDateInput = document.getElementById("booking_start_date");
const endDateInput = document.getElementById("booking_end_date");

const datePickr = () => {
  // setTimeout(() => console.log("Hello"), 1000);
  if (startDateInput) {
    // console.log("plsss");
    const unavailableDates = JSON.parse(
      document.querySelector("#venue-booking-dates").dataset.unavailable
    );
    // if (!(/account\/bookings\/\d+\/edit/).test(window.location.href)) {
    //   endDateInput.disabled = true;
    // }
    console.log(unavailableDates)
    flatpickr(startDateInput, {
      minDate: "today",
      disable: unavailableDates,
      dateFormat: "Y-m-d",
    });

    flatpickr(endDateInput, {
        minDate: "today",
        disable: unavailableDates,
        dateFormat: "Y-m-d",
      });
    // console.log("im in the file");

    startDateInput.addEventListener("change", (e) => {
      if (startDateInput != "") {
        endDateInput.disabled = false;
      }
      flatpickr(endDateInput, {
        minDate: e.target.value,
        disable: unavailableDates,
        dateFormat: "Y-m-d",
      });
    });
  }
};

export { datePickr };
