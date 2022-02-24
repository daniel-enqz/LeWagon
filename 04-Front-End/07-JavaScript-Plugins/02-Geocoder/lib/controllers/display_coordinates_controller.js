import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["userInput", "coordinatesPlace"]

  display(event) {
    event.preventDefault();
    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${this.userInputTarget.value}.json?access_token=pk.eyJ1IjoiZGFuaWVsLWVucXoiLCJhIjoiY2t6c3Y4dXBsMDE0NTJ4bnh5eGV2MjI1YSJ9.xyKeXgAsjXLAXhwDsKw06w`)
      .then(response => response.json())
      .then((data) => {
        const coordinatesTemplate = `Longitude: ${data.features[0].center[0]} Latitude: ${data.features[0].center[1]}`;
        this.coordinatesPlaceTarget.innerText = coordinatesTemplate;
      });
  }
}
