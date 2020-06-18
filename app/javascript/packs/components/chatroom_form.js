const initChatroomForm = () => {
  if (document.querySelector('#new_message')) {
    document.querySelector('#new_message').addEventListener('submit', (e) => {
      e.preventDefault();
      const Message = document.getElementById('message_content');
      console.log('message sent');
      Message.focus();
    });
  };
};

export { initChatroomForm };