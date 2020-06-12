const explorerToggle = () => {
  if (window.location.href.indexOf("explorer") > -1) {
    const explorerProjectsButton = document.querySelector('.btn-explorer-projects');
    const explorerArtistsButton = document.querySelector('.btn-explorer-artists');
    const explorerProjects = document.querySelector('.explorer-display-projects');
    const explorerArtists = document.querySelector('.explorer-display-artists');

    explorerArtistsButton.addEventListener('click', (event) =>{
      console.log("display explorer artists");
      explorerProjects.classList.add('hidden-explorer');
      explorerArtists.classList.remove('hidden-explorer');
      explorerProjectsButton.classList.remove('btn-explorer-active');
      explorerArtistsButton.classList.remove('btn-explorer-inactive');
      explorerArtistsButton.classList.add('btn-explorer-active');
    });

    explorerProjectsButton.addEventListener('click', (event) => {
      console.log("display explorer projects");
      explorerArtists.classList.add('hidden-explorer');
      explorerProjects.classList.remove('hidden-explorer');
      explorerArtistsButton.classList.remove('btn-explorer-active');
      explorerProjectsButton.classList.remove('btn-explorer-inactive');
      explorerProjectsButton.classList.add('btn-explorer-active');
    });
  }
};

export { explorerToggle };
