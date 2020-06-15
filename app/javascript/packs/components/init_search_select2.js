const initSearchSelect2 = () => {
  if (document.querySelector('.search-explorer-competences')) {
    $('.select2-search').select2({ width: '100%', multiple: true, maximumSelectionLength: 3});
  } else {
    $('.select2-search').select2({ width: '100%', multiple: true});
  }
};

export { initSearchSelect2 };
