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
    });
    
    projectsButton.addEventListener('click', (e) => {
      console.log("display projects")
      portfolio.classList.add('hidden');
      projects.classList.remove('hidden');
    });
  }
};  

export { portfolioToggle };