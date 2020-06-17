import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainers = document.getElementsByClassName('messages');
  $(".chatroom-main").animate({scrollTop: $('.active_footer').offset().top}, 0);
  if (messagesContainers.length > 0) {
    Array.from(messagesContainers).forEach((messagesContainer) => {
      const id = messagesContainer.dataset.chatroomId;
      consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
        received(data) {
          setTimeout(function(){
            messagesContainer.insertAdjacentHTML('beforeend', data);
            if (document.URL.includes(`chatroom_id=${id}`)) {
              $(".active_main")[0].scrollBy(0,400);
            }
          },550);
        }
      });
    });
  }
}

export { initChatroomCable };
