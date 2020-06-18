const initChatroomForm = () => {
  if (document.querySelector('#new_message')) {
      const message = document.querySelector('.active_footer input');
      console.log('hello');
      message.focus();
  };
};

export { initChatroomForm };
