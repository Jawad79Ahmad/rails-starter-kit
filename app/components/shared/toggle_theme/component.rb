# frozen_string_literal: true

module Shared
  module ToggleTheme
    # ToggleTheme Component
    class Component < BaseViewComponent
      def call
        moon_icon = read_svg(name: 'moon', id: 'theme-toggle-dark-icon', klass: 'hidden w-8 h-8')
        sun_icon = read_svg(name: 'sun', id: 'theme-toggle-light-icon', klass: 'hidden w-8 h-8')
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
