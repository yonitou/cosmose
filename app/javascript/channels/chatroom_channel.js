import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainers = document.getElementsByClassName('messages');
  if (messagesContainers.length > 0) {
    Array.from(messagesContainers).forEach((messagesContainer) => {
      const id = messagesContainer.dataset.chatroomId;
      consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
        received(data) {
          messagesContainer.insertAdjacentHTML('beforeend', data);
        }
      });
    });
  }
}

export { initChatroomCable };
