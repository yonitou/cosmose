const initChatroomForm = () => {
  if (document.querySelector('#new_message')) {
    document.querySelector('#new_message').addEventListener('submit', (e) => {
      e.preventDefault();
      $('#message_content').focus()
    });
  };
};