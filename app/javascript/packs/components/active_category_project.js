const newProjectCategories = () => {
  const projectCategories = document.querySelectorAll('.project-categories');
  if (projectCategories) {
    projectCategories.forEach((categorie) => {
      categorie.addEventListener('click', (e) => {
        console.log('clickclick');
        categorie.classList.toggle('active');
      })
    });
  };
};

export { newProjectCategories };