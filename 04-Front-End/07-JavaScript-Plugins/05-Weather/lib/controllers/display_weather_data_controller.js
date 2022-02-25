import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["name", "date", "temp", "description", "img", "userInput"]

  initialize() {
    this.apiKey = "7abddf8e22023d3c490ed409384cd672";
  }

  connect() {
    this.userInputTarget.value = "";
    navigator.geolocation.getCurrentPosition((info) => {
      fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${info.coords.latitude}&lon=${info.coords.latitude}&units=metric&appid=${this.apiKey}`)
        .then(response => response.json())
        .then((data) => { this.#fetchData(data); });
    });
  }

  display(event) {
    event.preventDefault();
    fetch(`https://api.openweathermap.org/data/2.5/weather?q=${this.userInputTarget.value}&units=metric&appid=${this.apiKey}`)
      .then(response => response.json())
      .then((data) => { this.#fetchData(data); });
  }

  #fetchData(data) {
    this.nameTarget.innerText = data.name || "Mexico";
    const dateTransformation = new Date(data.dt * 1000);
    this.dateTarget.innerText = dateTransformation.toString();
    this.descriptionTarget.innerText = data.weather[0].description;
    this.tempTarget.innerText = data.main.temp.toString();
    this.imgTarget.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`;
  }
}
