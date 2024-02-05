import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  }

  toggleSidebar() {
    const sidebar = document.querySelector('aside');
    const sidebarBackdrop = document.querySelector('div.sidebar-backdrop');
    const removeSidebarBtn = document.querySelector('button.remove-sidebar');

    sidebar.classList.toggle('hidden');
    sidebarBackdrop.classList.toggle('hidden');
  }
}
