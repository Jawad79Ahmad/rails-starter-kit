# frozen_string_literal: true

module Sidebar
  module MenuLink
    # Sidebar Menu Link Component
    class Component < BaseViewComponent
      ACTIVE_MENU = 'text-gray-800 dark:text-gray-200 bg-gray-200 dark:bg-gray-900'
      INACTIVE_MENU = 'hover:text-gray-800 dark:hover:text-gray-200 hover:bg-gray-200 dark:hover:bg-gray-900'
      MENU_CLASSES = 'px-3 py-2 inline-flex items-center w-full font-semibold transition-colors duration-150 rounded-lg'

      def initialize(name: '', klass: '', link: '#', fa_icon: '')
        super
        @name = name.to_s
        @klass = klass
        @link = link
        @fa_icon = fa_icon
      end

      def call
        link_klass = Current.request.path == @link ? ACTIVE_MENU : INACTIVE_MENU
        menu_title = content_tag(:span, @name.underscore.gsub(' ', '_').titleize, class: 'ml-4')
        content_tag(:li, class: 'relative px-3 py-1') do
          link_to @link, class: "#{@klass} #{link_klass} #{MENU_CLASSES}" do
            content_tag(:i, '', class: "w-5 #{@fa_icon}") + menu_title
          end
        end
      end
    end
  end
end
