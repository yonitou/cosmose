

  const firstArrow = () => {
    const arrow = $('#first-arrow')
    if (arrow) {
      arrow.on('click', function(e) {
      e.preventDefault();
      $('html, body').animate({ scrollTop: $($(this).attr('href')).offset().top}, 500, 'linear');
    });
    }
  }

  export { firstArrow }
