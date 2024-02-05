# frozen_string_literal: true

module Shared
  module ToggleTheme
    # ToggleTheme Component
    class Component < BaseViewComponent
      def call
        moon_icon = content_tag(:i, '', class: 'hidden w-8 h-8 fa-regular fa-moon', id: 'theme-toggle-dark-icon')
        sun_icon = content_tag(:i, '', class: 'hidden w-8 h-8 fa-regular fa-sun', id: 'theme-toggle-light-icon')
        button_tag(
          type: 'button', id: 'theme-toggle',
          class: 'text-cyan-600 hover:text-cyan-700 dark:text-cyan-700 dark:hover:text-cyan-800',
          data: { action: 'click->toggle_theme#toggleTheme' }
        ) do
          moon_icon + sun_icon
        end
      end
    end
  end
end
