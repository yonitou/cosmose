const addBlockBtn = document.querySelector('.cta_add_block');
const cancelBlockBtn = document.querySelector('.cta_cancel_block');

const hideBlockElements = () => {
  document.querySelector('#new_block').classList.toggle('hidden');
  cancelBlockBtn.classList.toggle('hidden');
  addBlockBtn.classList.toggle('hidden');
};

const blockForm = () => {
  if (addBlockBtn) {
    addBlockBtn.addEventListener('click', (e) => {
      hideBlockElements();
    })
    cancelBlockBtn.addEventListener('click', (e) => {
      hideBlockElements();
    });
  };
};

export { blockForm };
