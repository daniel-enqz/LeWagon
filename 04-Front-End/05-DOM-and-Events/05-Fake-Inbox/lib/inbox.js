/* eslint-disable no-multiple-empty-lines */

const hasNewMessage = () => {
  // TODO: return true with a probability of 20%.
  const value1 = Math.random() * (11 - 1) + 1;
  return value1 <= 2;
};

const newMessage = () => {
  // TODO: return a random message as an object with two keys, subject and sender
  const array = [{
    sender: 'GitHub Team',
    subject: 'Welcome to GitHub'
  },
  {
    sender: 'Arnold Schwarzenegger',
    subject: "I'm Back"
  }];
  return array[Math.floor(Math.random() * array.length)];
};

const appendMessageToDom = (message) => {
  // TODO: append the given message to the DOM (as a new row of `#inbox`)
};

const refresh = () => {
  // TODO: Implement the global refresh logic. If there is a new message,
  //       append it to the DOM. Update the unread counter in title as well.
};

















// Do not remove these lines:
document.addEventListener("DOMContentLoaded", () => {
  setInterval(refresh, 1000); // Every 1 second, the `refresh` function is called.
});

module.exports = { hasNewMessage, newMessage };
