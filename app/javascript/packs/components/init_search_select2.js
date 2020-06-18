const initSearchSelect2 = () => {
  if (document.querySelector('.search-explorer-competences')) {
    $('.select2-search').select2({width: '100%', placeholder: "Compétences"});
  } else if (document.querySelector('.search-explorer-category')) {
    $('.select2-search').select2({width: '100%', placeholder: "Catégorie"});
  }
    $('.select2-search').val("").trigger('change');
};

export { initSearchSelect2 };
