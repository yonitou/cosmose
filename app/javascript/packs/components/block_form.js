const block_form = () => {
  const addBlockBtn = document.querySelector('.cta_add_block');
  const cancelBlockBtn = document.querySelector('.cta_cancel_block');
  if (addBlockBtn) {
    addBlockBtn.addEventListener('click', (e) => {
      document.querySelector('#new_block').classList.toggle('hidden');
      document.querySelector('.cta_cancel_block').classList.toggle('hidden');
      addBlockBtn.classList.toggle('hidden');
      console.log('hiding form');
    }
  )};
};

export { block_form };