# frozen_string_literal: true

module Sidebar
  module SubMenu
    module Item
      # Sidebar Sub Menu Item Component
      class Component < BaseViewComponent
        def initialize(title: '', link: '#')
          super
          @title = title.to_s
          @link = link
        end

        def call
          content_tag(:li, class: 'w-full flex') do
            link_to @link, class: 'px-2 py-1 w-full transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-800 rounded-lg' do
              content_tag(:span, @title.titleize)
            end
          end
        end
      end
    end
  end
end
