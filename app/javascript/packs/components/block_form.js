

const hideBlockElements = (addButton, cancelButton) => {
  document.querySelector('#new_block').classList.toggle('hidden');
  cancelButton.classList.toggle('hidden');
  addButton.classList.toggle('hidden');
};

const blockForm = () => {
  const addBlockBtn = document.querySelector('.cta_add_block');
  const cancelBlockBtn = document.querySelector('.cta_cancel_block');
  if (addBlockBtn) {
    addBlockBtn.addEventListener('click', (e) => {
      hideBlockElements(addBlockBtn, cancelBlockBtn);
    })
    cancelBlockBtn.addEventListener('click', (e) => {
      hideBlockElements(addBlockBtn, cancelBlockBtn);
    });
  };
};

export { blockForm };
