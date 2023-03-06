// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "popper.js"
import "bootstrap"
import '@fortawesome/fontawesome-free/js/all';
import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// 応用課題7a、jquery呼び出しのため追記
window.$ = window.jQuery = require('jquery');
require('packs/raty')

// 応用課題7a、DWO参照して追記、するとBootstrapがなぜか崩れる…
import Raty from "raty.js"
window.raty = function(elem,opt) {
  let raty =  new Raty(elem,opt)
  raty.init();
  return raty;
}
