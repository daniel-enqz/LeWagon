// TODO: React to a click on the button!
document.querySelectorAll("button").forEach((button) => {
  button.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("disabled");
    button.innerText = "Bingo!";
    const audio = new Audio('audio_file.mp3');
    audio.play();
  });
});
