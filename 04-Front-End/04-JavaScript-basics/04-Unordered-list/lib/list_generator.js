const listItem = (content) => {
  // TODO: return the proper <li> HTML tag with its content (as a string)
  const templateFn = expression => `<li class="list-group-item">${content}</li>`;
  return templateFn();
};

const unorderedList = (items) => {
  // TODO: return the proper <ul> markup (as a string)
  const templateFn = expression => `<ul class="list-group">
  ${items.map(item => `<li class="list-group-item">${item}</li>\n  `).join('')}</ul>`;
  return templateFn();
};

module.exports = { listItem, unorderedList }; // Do not remove.
