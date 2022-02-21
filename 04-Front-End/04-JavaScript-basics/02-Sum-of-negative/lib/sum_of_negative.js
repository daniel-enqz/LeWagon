const sumOfNegative = (numbers) => {
  // TODO: You are getting a `numbers` array. Return the sum of **negative** numbers only.
  let sum = 0;

  numbers.forEach((number) => {
    sum += (number < 0 ? number : 0);
  });
  return sum;
};

module.exports = sumOfNegative; // Do not remove.

console.log(sumOfNegative([-4, 5, -2, 9]));
