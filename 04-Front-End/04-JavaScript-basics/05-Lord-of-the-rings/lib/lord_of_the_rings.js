const isGood = (soldierType) => {
  const good = ["Hobbits", "Elves", "Dwarves", "Eagles"];
  return good.includes(soldierType);
};

const buildSoldierObject = (battlefield) => {
  // TODO: Given a battlefield (String), return an object of forces.
  const RellenoDeJson = battlefield.replace(/([A-z-]+)/g, '"$1"');
  const splitted = RellenoDeJson.split(",");
  return JSON.parse(`{${RellenoDeJson}}`);
};

const whoWinsTheWar = (battlefield) => {
  // TODO: Based on the battlefield's description (it's a String), return "Good", "Evil" or "Tie".
  let GoodSum = 0;
  let EvilSum = 0;
  const object = buildSoldierObject(battlefield);
  const keys = Object.keys(object);
  keys.forEach((key) => {
    if (isGood(key)) {
      GoodSum += object[key];
    } else {
      EvilSum += object[key];
    }
  });
  let result;
  if (GoodSum > EvilSum) {
    result = "Good";
  } else if (EvilSum > GoodSum) {
    result = "Evil";
  } else {
    result = "Tie";
  }
  return result;
};
module.exports = { whoWinsTheWar, buildSoldierObject, isGood }; // Do not remove this line
