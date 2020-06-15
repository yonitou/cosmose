const projectPublicButton = document.querySelector('.toggle-public');
const projectPrivateButton = document.querySelector('.toggle-private');
const projectPublic = document.querySelector('.blocks-public');
const projectPrivate = document.querySelector('.blocks-private');


const hideToggle = () => {
   projectPublic.classList.toggle('hidden');
   projectPrivate.classList.toggle('hidden');
   projectPublicButton.classList.toggle('btn-explorer-active');
   projectPrivateButton.classList.toggle('btn-explorer-inactive');
   projectPrivateButton.classList.toggle('btn-explorer-active');
   projectPublicButton.classList.toggle('btn-explorer-inactive');
};

const projectToggle = () => {
  if (document.querySelector('.project-toggle')) {
    projectPublicButton.addEventListener('click', (event) => {
      hideToggle();
    });
    projectPrivateButton.addEventListener('click', (event) => {
      hideToggle();
    });
  };
};

export { projectToggle };
