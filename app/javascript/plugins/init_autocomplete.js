import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('project_address');
  const userInput = document.getElementById('user_address');
  const searchInput = document.getElementById('address');
  if (addressInput){
    places({ container: addressInput });
  } else if (userInput) {
    places({ container: userInput });
  } else if (searchInput) {
    places({ container: searchInput })
  }
};

export { initAutocomplete };
