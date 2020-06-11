const isEveryInputEmpty = () => {
    let allEmpty = true;
    document.querySelectorAll('.required-inputs').forEach((field) => {
        if (field.value === "") {
            allEmpty = false;

            return false;
        }
    });
    allEmpty === false ?  alert('Merci de remplir tous les champs') : allEmpty;
    return allEmpty;
}

  const buttonNextStepProject = () => {
    document.querySelector(".next-step-button").addEventListener('click', (event) => {
      if (isEveryInputEmpty()) {
        document.querySelector(".project-new-first-part").classList.add("d-none");
        document.querySelector(".project-new-second-part").classList.remove("d-none");
      }
    });
    document.querySelector(".next-step-button-last").addEventListener('click', (event) => {
      if (isEveryInputEmpty()) {
        document.querySelector(".project-new-second-part").classList.add("d-none");
        document.querySelector(".project-new-third-part").classList.remove("d-none");
      }
    });
    document.querySelector(".last-step-button").addEventListener('click', (event) => {
      if (isEveryInputEmpty()) {
        document.querySelector(".project-new-first-part").classList.remove("d-none");
        document.querySelector(".project-new-second-part").classList.add("d-none");
      }
    });
    document.querySelector(".last-step-button-final").addEventListener('click', (event) => {
      if (isEveryInputEmpty()) {
        document.querySelector(".project-new-second-part").classList.remove("d-none");
        document.querySelector(".project-new-third-part").classList.add("d-none");
      }
    });
};

export { buttonNextStepProject };
