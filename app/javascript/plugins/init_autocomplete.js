import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('project_address');
  const userInput = document.getElementById('user_address');
  if (addressInput){
    places({ container: addressInput });
  } else if (userInput) {
    places({ container: userInput });
  }
};

export { initAutocomplete };
