const cast = (data) => {
  if (data === "true") {
    return true;
  }

  if (data === "false") {
    return false;
  }

  if ((data.match(/\d/g) || []).length === data.length) {
    return Number.parseInt(data, 10);
  }
  return data;
};

const dataset = (element) => {
  // TODO: return the element's data attributes in an object
  const openingTag = element.split('>')[0];
  const raw = openingTag.match(/data-\w+="\w+"/gm) || [];
  const attributesObject = {};
  raw.forEach((attribute) => {
    const matchData = attribute.match(/data-(.+)="(.+)"/);
    attributesObject[matchData[1]] = cast(matchData[2]);
  });
  return attributesObject;
};

module.exports = dataset; // Do not remove.
