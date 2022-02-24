import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";

window.Stimulus = Application.start();
const context = require.context("./controllers", true, /\.js$/);
// eslint-disable-next-line no-undef
Stimulus.load(definitionsFromContext(context));

// https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b34baa16244d2b898ddd16abd48c7982
