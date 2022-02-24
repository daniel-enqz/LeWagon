import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";
export default class extends Controller {
  static targets = ["userInput", "coordinatesPlace"]

  display(event) {
    event.preventDefault();
    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${this.userInputTarget.value}.json?access_token=pk.eyJ1IjoiZGFuaWVsLWVucXoiLCJhIjoiY2t6c3Y4dXBsMDE0NTJ4bnh5eGV2MjI1YSJ9.xyKeXgAsjXLAXhwDsKw06w`)
      .then(response => response.json())
      .then((data) => {
        const longitude = data.features[0].center[0];
        const latitude = data.features[0].center[1];
        const coordinatesTemplate = `Longitude: ${longitude} Latitude: ${latitude}`;
        this.coordinatesPlaceTarget.innerText = coordinatesTemplate;
        mapboxgl.accessToken = `pk.eyJ1IjoiZGFuaWVsLWVucXoiLCJhIjoiY2t6c3Y4dXBsMDE0NTJ4bnh5eGV2MjI1YSJ9.xyKeXgAsjXLAXhwDsKw06w`;
        const map = new mapboxgl.Map({
          container: "map",
          style: "mapbox://styles/mapbox/streets-v9",
          center: [longitude, latitude],
          zoom: 12
        });
        new mapboxgl.Marker()
          .setLngLat([longitude, latitude])
          .addTo(map);
      });
  }
}
