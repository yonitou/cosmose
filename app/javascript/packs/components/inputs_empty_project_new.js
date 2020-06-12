const isEveryInputEmpty = (part) => {
    let allEmpty = true;
    document.querySelectorAll(`.required-inputs-project-${part}`).forEach((field) => {
        if (field.value === "") {
            allEmpty = false;

            return false;
        }
    });
    allEmpty === false ?  alert('Merci de remplir tous les champs') : allEmpty;
    return allEmpty;
}

  const buttonNextStepProject = () => {
    if (document.querySelector('.form-new-project')) {
      document.querySelector(".next-step-button").addEventListener('click', (event) => {
        if (isEveryInputEmpty(1)) {
          document.querySelector(".project-new-first-part").classList.add("d-none");
          document.querySelector(".project-new-second-part").classList.remove("d-none");
        }
      });
      document.querySelector(".next-step-button-last").addEventListener('click', (event) => {
        if (isEveryInputEmpty(2)) {
          document.querySelector(".project-new-second-part").classList.add("d-none");
          document.querySelector(".project-new-third-part").classList.remove("d-none");
        }
      });
      document.querySelector(".last-step-button").addEventListener('click', (event) => {
          document.querySelector(".project-new-first-part").classList.remove("d-none");
          document.querySelector(".project-new-second-part").classList.add("d-none");
      });
      document.querySelector(".last-step-button-final").addEventListener('click', (event) => {
        if (isEveryInputEmpty(3)) {
          document.querySelector(".project-new-second-part").classList.remove("d-none");
          document.querySelector(".project-new-third-part").classList.add("d-none");
        }
      });
    }
};

export { buttonNextStepProject };
