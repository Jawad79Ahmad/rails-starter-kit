import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  }

  toggleSidebar() {
    const sidebar = document.querySelector('aside');
    const sidebarBackdrop = document.querySelector('div.sidebar-backdrop');
    const removeSidebarBtn = document.querySelector('button.remove-sidebar');

    if(sidebar.classList.contains('hidden')) {
      sidebar.classList.remove('hidden');
    } else {
      sidebar.classList.add('hidden');
    }

    if(sidebar.classList.contains('absolute')) {
      sidebar.classList.remove('absolute');
    } else {
      sidebar.classList.add('absolute');
    }

    if(sidebar.classList.contains('z-50')) {
      sidebar.classList.remove('z-50');
    } else {
      sidebar.classList.add('z-50');
    }

    if(sidebar.classList.contains('h-screen')) {
      sidebar.classList.remove('h-screen');
    } else {
      sidebar.classList.add('h-screen');
    }

    if(sidebarBackdrop.classList.contains('hidden')) {
      sidebarBackdrop.classList.remove('hidden');
    } else {
      sidebarBackdrop.classList.add('hidden');
    }

    if(removeSidebarBtn.classList.contains('hidden')) {
      removeSidebarBtn.classList.remove('hidden');
    } else {
      removeSidebarBtn.classList.add('hidden');
    }
  }
}
