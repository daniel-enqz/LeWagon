const buttons = document.querySelectorAll(".clickable");

const toggleActiveClass = (event) => {
  event.currentTarget.classList.toggle("active");
};

const bindSportToClick = (button) => {
  button.addEventListener('click', toggleActiveClass);
};

buttons.forEach(bindSportToClick);
