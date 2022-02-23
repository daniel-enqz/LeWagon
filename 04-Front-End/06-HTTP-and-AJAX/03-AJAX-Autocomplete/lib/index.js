// TODO: Autocomplete the input with AJAX calls.
const search = document.querySelector("#search");
const results = document.querySelector("#results");

const updateSearch = (query) => {
  fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${query}`)
    .then(response => response.json())
    .then((data) => {
      data.words.forEach((element) => {
        console.log(element);
        results.insertAdjacentHTML("beforeend", `<li>${element}</li>`);
      });
    });
};

search.addEventListener("keyup", (event) => {
  results.innerHTML = "";
  updateSearch(search.value);
});
