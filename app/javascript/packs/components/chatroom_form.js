const initChatroomForm = () => {
  if (document.querySelector('#new_message')) {
      const message = document.querySelector('.active_footer input');
      message.focus();
  };
};

export { initChatroomForm };
