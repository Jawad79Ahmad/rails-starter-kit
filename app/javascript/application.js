// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import jquery from 'jquery';
window.jQuery = jquery;
window.$ = jquery;

import Alpine from 'alpinejs';
window.Alpine = Alpine;
Alpine.start();

import "@fortawesome/fontawesome-free/js/all";
