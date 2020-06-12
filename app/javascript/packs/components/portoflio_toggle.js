const portfolioToggle = () => {
  if (window.location.href.indexOf("portfolio") > -1) {
    const projectsButton = document.querySelector('.btn-profile-projects')
    const portfolioButton = document.querySelector('.btn-profile-portfolio');
    const projects = document.querySelector('.user-projects');
    const portfolio = document.querySelector('.user-portfolio');

    portfolioButton.addEventListener('click', (e) => {
      console.log("display portfolio")
      projects.classList.add('hidden');
      portfolio.classList.remove('hidden');
      projectsButton.classList.remove('btn-profile-active');
      portfolioButton.classList.remove('btn-profile-inactive');
      portfolioButton.classList.add('btn-profile-active');
    });
    
    projectsButton.addEventListener('click', (e) => {
      console.log("display projects")
      portfolio.classList.add('hidden');
      projects.classList.remove('hidden');
      portfolioButton.classList.remove('btn-profile-active');
      projectsButton.classList.remove('btn-profile-inactive');
      projectsButton.classList.add('btn-profile-active');
    });
  }
};  

export { portfolioToggle };