 const buttonCollaborer = () => {
    const collaborationRequestButton = document.querySelector(".collaborer-btn")
    if (collaborationRequestButton) {
      collaborationRequestButton.addEventListener('click', (event) => {
          document.querySelector(".request-collaboration").classList.remove("d-none");
        }
      );
    }
};

export { buttonCollaborer };
