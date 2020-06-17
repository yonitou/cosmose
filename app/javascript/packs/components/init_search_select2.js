const initSearchSelect2 = () => {
  if (document.querySelector('.search-explorer-competences')) {
    $('.select2-search').select2({width: '100%', multiple: true, maximumSelectionLength: 3, placeholder: "Compétences",
    allowClear: true});
    $('.select2-search').val("").trigger('change');
  } else if (document.querySelector('.search-explorer-category')) {
    $('.select2-search').select2({ width: '100%', multiple: true, placeholder: "Compétences" });
    $('.select2-search').val("").trigger('change');
  }

};

export { initSearchSelect2 };
