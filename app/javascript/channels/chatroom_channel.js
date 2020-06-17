import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainers = document.getElementsByClassName('messages');
  let active_input = Array.from(document.querySelectorAll('input')).filter((input) => {
    return input.parentElement.parentElement.parentElement.parentElement.classList.contains('d-none') == false;
  });
  if (messagesContainers.length > 0) {
    Array.from(messagesContainers).forEach((messagesContainer) => {
      const id = messagesContainer.dataset.chatroomId;
      consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
        received(data) {
          messagesContainer.insertAdjacentHTML('beforeend', data);
          if (document.URL.includes(`chatroom_id=${id}`)) {
         $(".chatroom-main").animate({scrollTop: $(active_input[0]).offset().top}, 600);
        }
        }
      });
    });
  }
}

export { initChatroomCable };
