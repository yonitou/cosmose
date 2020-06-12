const isEveryInputEmpty = () => {

    let allEmpty = true;
    document.querySelectorAll('.required-inputs-registration').forEach((field) => {
        if (field.value === "") {
            allEmpty = false;

            return false;
        }
    });
    allEmpty === false ?  alert('Merci de remplir tous les champs') : allEmpty;
    return allEmpty;
}

  const buttonNextStep = () => {
    document.querySelector(".next-step-button-registration").addEventListener('click', (event) => {
      if (isEveryInputEmpty()) {
        document.querySelector(".registration-new-first-part").classList.add("d-none");
        document.querySelector(".registration-new-second-part").classList.remove("d-none");
      }
    });
};

export { buttonNextStep };
