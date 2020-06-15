const hideToggle = (publicButton, privateButton, projectPublic, projectPrivate) => {
   projectPublic.classList.toggle('hidden');
   projectPrivate.classList.toggle('hidden');
   publicButton.classList.toggle('btn-explorer-active');
   privateButton.classList.toggle('btn-explorer-inactive');
   privateButton.classList.toggle('btn-explorer-active');
   publicButton.classList.toggle('btn-explorer-inactive');
};

const projectToggle = () => {
  const projectPublicButton = document.querySelector('.toggle-public');
  const projectPrivateButton = document.querySelector('.toggle-private');
  const projectPublic = document.querySelector('.blocks-public');
  const projectPrivate = document.querySelector('.blocks-private');
  if (document.querySelector('.project-toggle')) {
    projectPublicButton.addEventListener('click', (event) => {
      hideToggle(projectPublicButton, projectPrivateButton, projectPublic, projectPrivate);
    });
    projectPrivateButton.addEventListener('click', (event) => {
      hideToggle(projectPublicButton, projectPrivateButton, projectPublic, projectPrivate);
    });
  };
};

export { projectToggle };
