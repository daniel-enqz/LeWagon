const isGood = (soldierType) => {
  const good = ["Hobbits", "Elves", "Dwarves", "Eagles"];
  return good.includes(soldierType);
};

const buildSoldierObject = (battlefield) => {
  // TODO: Given a battlefield (String), return an object of forces.
  const rellenoDeJson = battlefield.replace(/([A-z-]+)/g, '"$1"');
  return JSON.parse(`{${rellenoDeJson}}`);
};

const whoWinsTheWar = (battlefield) => {
  // TODO: Based on the battlefield's description (it's a String), return "Good", "Evil" or "Tie".
  let goodSum = 0;
  let evilSum = 0;
  const object = buildSoldierObject(battlefield);
  const keys = Object.keys(object);
  keys.forEach((key) => {
    if (isGood(key)) {
      goodSum += object[key];
    } else {
      evilSum += object[key];
    }
  });
  if (goodSum === evilSum) return "Tie";

  return goodSum > evilSum ? "Good" : "Evil";
};
module.exports = { whoWinsTheWar, buildSoldierObject, isGood }; // Do not remove this line
