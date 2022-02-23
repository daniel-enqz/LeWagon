const displayAlertOnButtonClick = () => {
  // TODO: Select the big green button
  const button = document.querySelector(".btn");
  // TODO: Bind the `click` event to the button
  button.addEventListener("click", (event) => {
    alert("Thank you!");
  });
};

displayAlertOnButtonClick(); // Do not remove!
