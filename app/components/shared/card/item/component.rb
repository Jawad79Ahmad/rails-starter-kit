# frozen_string_literal: true

module Shared
  module Dropdown
    module Item
      # Common Dropdown Item Component
      class Component < BaseViewComponent
        ITEM_CLASS = 'inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200'

        def item(link: '', data: '', klass: '')
          klass = "#{ITEM_CLASS} #{klass}"
          content_tag(:li, class: 'flex') do
            if link.present?
              link_to(link, class: klass) { data }
            else
              content_tag(:div, class: klass) { data }
            end
          end
        end
      end
    end
  end
end
