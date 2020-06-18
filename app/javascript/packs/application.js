// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import $ from 'jquery';
import 'select2';
import '@justinribeiro/lite-youtube';




// Internal imports, e.g:
import { initSelect2 } from './components/init_select2';
import { initSearchSelect2 } from './components/init_search_select2';
import { buttonNextStep } from './components/inputs_empty_registration';
import { buttonNextStepProject } from './components/inputs_empty_project_new';
import { initTypeJs } from './components/type';
import { portfolioToggle } from './components/portoflio_toggle';
import { explorerToggle } from './components/explorer_toggle';
import { blockForm } from './components/block_form';
import { projectToggle } from './components/project_toggle';
import { buttonCollaborer } from './components/collaborer_form';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { firstArrow } from './components/arrow_home';
import { initChatroomCable } from '../channels/chatroom_channel';
import { initChatroomForm } from './components/chatroom_form';
import { newProjectCategories } from './components/active_category_project';


document.addEventListener('turbolinks:load', () => {
  initChatroomCable();
  projectToggle();
  blockForm();
  initSelect2();
  buttonNextStep();
  buttonNextStepProject();
  initTypeJs();
  portfolioToggle();
  explorerToggle();
  buttonCollaborer();
  initAutocomplete();
  firstArrow();
  initSearchSelect2();
  initChatroomForm();
  newProjectCategories();
});
