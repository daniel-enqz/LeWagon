// TODO 1. Open the `index.html` file and set an id to the France <li>
// (nothing to write in this file for this step)

const franceElement = (element) => {
  // TODO 2: select the France list item and return it!
  console.log(element.innerText);
};
const element = document.querySelector("#france");
franceElement(element);

module.exports = franceElement; // Do not remove.
