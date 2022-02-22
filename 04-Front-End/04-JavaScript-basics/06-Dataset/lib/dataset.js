const dataset = (element) => {
  // TODO: return the element's data attributes in an object
  const array = element.match(/data-\w+="\w+"/gm);
  console.log(array);
  return JSON.parse(`{${array}}`);
};

module.exports = dataset; // Do not remove.

const burger = `<div class="card" data-id="42" data-price="15" data-category="popular">
  <div class="card-category">Popular</div>
  <div class="card-description">
    <h2>The best burger in town (15€)</h2>
  </div>
</div>`;

dataset(burger);
