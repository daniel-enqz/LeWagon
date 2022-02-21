const valid = (email) => {
  // TODO: return true if the `email` string has the right pattern!
  const validRegex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
  return validRegex.test(email);
};

module.exports = valid; // Do not remove.
