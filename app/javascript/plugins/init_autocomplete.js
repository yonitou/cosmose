import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('project_address');
  const userInput = document.getElementById('user_address');
  const searchArtistInput = document.getElementById('search-address-artist');
  const searchProjectInput = document.getElementById('search-address-project');
  if (addressInput){
    places({ container: addressInput });
  } else if (userInput) {
    places({ container: userInput });
  } else if (searchArtistInput && searchProjectInput ) {
    places({ container: searchArtistInput })
    places({ container: searchProjectInput })
  }
};

export { initAutocomplete };
