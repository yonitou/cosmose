const initSelect2 = () => {
  if ($('.required-inputs-project-1')) {
    $('.select2').select2({ width: '100%', multiple: true, maximumSelectionLength: 3});
    $(".project-categories").on("click", function () {
    let oldValue = $('.select2').val();
      if (oldValue.length < 3) {
        oldValue.push($(this).text());
        $('.select2').val(oldValue).trigger('change');
      } else {
        alert('Vous ne pouvez pas sélectionner plus de 3 catégories par projet')
      }
    });
  } else {
    $('.select2').select2({ width: '100%', multiple: true});
  }
};

export { initSelect2 };
