const initSelect2 = () => {
  if ($('.required-inputs-project-1')) {
    $('.select2').select2({ width: '100%', multiple: true, maximumSelectionLength: 3});
    $('.select2').hide();
    $(".project-categories").on("click", function () {
      let oldValue = $('.select2').val();
      if (oldValue.includes($(this).text())) {
        const i = oldValue.indexOf($(this).text());
        if (i > -1) {
          oldValue.splice(i, 1);
        }
        $('.select2').val(oldValue).trigger('change');
        $(this).removeClass('active');
      } else {

        if ($('.select2').val().length >= 3) {
          alert('Vous ne pouvez pas sélectionner plus de 3 catégories par projet');

        } else {
          oldValue.push($(this).text());
          $('.select2').val(oldValue).trigger('change');
          $(this).addClass('active');
        }
      }
    });
  } else {
    $('.select2').select2({ width: '100%', multiple: true});
  }
};

export { initSelect2 };
