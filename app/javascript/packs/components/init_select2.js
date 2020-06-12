const initSelect2 = () => {
  if (document.querySelector('.required-inputs-project-1')) {
    $('.select2').select2({ width: '100%', multiple: true, maximumSelectionLength: 3});
  } else {
    $('.select2').select2({ width: '100%', multiple: true});
  }
};

export { initSelect2 };
