const portfolioToggle = () => {
    const projectsButton = document.querySelector('.btn-profile-projects');
    const portfolioButton = document.querySelector('.btn-profile-portfolio');
    const projects = document.querySelector('.user-projects');
    const portfolio = document.querySelector('.user-portfolio');
  if (portfolioButton) {
    portfolioButton.addEventListener('click', (e) => {
      projects.classList.add('hidden');
      portfolio.classList.remove('hidden');
      projectsButton.classList.remove('btn-profile-active');
      portfolioButton.classList.remove('btn-profile-inactive');
      portfolioButton.classList.add('btn-profile-active');
    });
    projectsButton.addEventListener('click', (e) => {
      portfolio.classList.add('hidden');
      projects.classList.remove('hidden');
      portfolioButton.classList.remove('btn-profile-active');
      projectsButton.classList.remove('btn-profile-inactive');
      projectsButton.classList.add('btn-profile-active');
    });
  }
};

export { portfolioToggle };
