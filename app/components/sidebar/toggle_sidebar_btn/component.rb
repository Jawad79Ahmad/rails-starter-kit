# frozen_string_literal: true

module Sidebar
  module ToggleSidebarBtn
    # Toggle Sidebar Btn Component
    class Component < BaseViewComponent
      def call
        content_tag(
          :button,
          type: 'button',
          data: { controller: 'toggle_sidebar_btn', action: 'click->toggle_sidebar_btn#toggleSidebar' },
          class: 'remove-sidebar hidden ms-auto -mx-1.5 -my-1.5 rounded-lg h-8 w-8 bg-gray-50 hover:bg-gray-200 dark:bg-gray-800 dark:hover:bg-gray-700'
        ) do
          content_tag(:div, class: 'flex items-center justify-center') do
            read_svg(name: 'cross', klass: 'h-3 w-3 text-cyan-600')
          end
        end
      end
    end
  end
end
