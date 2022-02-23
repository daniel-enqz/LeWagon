const batch = 829; // change to your own batch id
const baseUrl = "https://wagon-chat.herokuapp.com/";

const submit = document.querySelector("#comment-form");
const messageToSend = document.getElementById("your-message");
const nameToSend = document.getElementById("your-name");
const messagesList = document.querySelector(".list-unstyled");
// Your turn to code!
const diaplyMessages = () => {
  fetch(`https://wagon-chat.herokuapp.com/${batch}/messages`)
    .then(response => response.json())
    .then((data) => {
      data.messages.forEach((result) => {
        const messageTemplate = `<li>${result.content} (posted <span class="date">${result.created_at}</span>) by ${result.author}</li>`;
        messagesList.insertAdjacentHTML("beforeend", messageTemplate);
      });
    });
};

const addMessages = () => {
  fetch(`https://wagon-chat.herokuapp.com/${batch}/messages`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ content: messageToSend.value, author: nameToSend.value })
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    });
  messageToSend.value = "";
  nameToSend.value = "";
};

const refresh = () => {
  messagesList.innerHTML = "";
  diaplyMessages();
};

submit.addEventListener("submit", (event) => {
  event.preventDefault();
  addMessages();
});

document.addEventListener("DOMContentLoaded", () => {
  setInterval(refresh, 10000); // Every 1 second, the `refresh` function is called.
});
