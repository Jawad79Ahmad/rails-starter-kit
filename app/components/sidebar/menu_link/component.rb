# frozen_string_literal: true

module Sidebar
  module MenuLink
    # Sidebar Menu Link Component
    class Component < BaseViewComponent
      ACTIVE_MENU = 'text-gray-800 dark:text-gray-200 bg-gray-100 dark:bg-gray-900'
      INACTIVE_MENU = 'hover:text-gray-800 dark:hover:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-900'
      MENU_CLASSES = 'px-3 py-2 inline-flex items-center w-full font-semibold transition-colors duration-150 rounded-lg'

      def initialize(name: '', klass: '', link: '#')
        super
        @name = name
        @klass = klass
        @link = link
      end

      def call
        link_klass = Current.request.path == @link ? ACTIVE_MENU : INACTIVE_MENU
        menu_svg = read_svg(name: @name, klass: 'w-5 h-5')
        menu_title = content_tag(:span, @name.underscore.gsub(' ', '_').titleize, class: 'ml-4')
        content_tag(:li, class: 'relative px-3 py-1') do
          link_to @link, class: "#{@klass} #{link_klass} #{MENU_CLASSES}" do
            menu_svg + menu_title
          end
        end
      end
    end
  end
end
