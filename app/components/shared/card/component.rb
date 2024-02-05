# frozen_string_literal: true

module Shared
  module Card
    # Common Dropdown Component
    class Component < BaseViewComponent
      ORANGE_CARD = 'hover:bg-orange-50 dark:hover:bg-orange-800'
      GREEN_CARD = 'hover:bg-green-50 dark:hover:bg-green-800'
      BLUE_CARD = 'hover:bg-blue-50 dark:hover:bg-blue-800'
      TEAL_CARD = 'hover:bg-teal-50 dark:hover:bg-teal-800'

      ORANGE_SVG = 'text-orange-500 bg-orange-100 dark:text-orange-100 dark:bg-orange-500'
      GREEN_SVG = 'text-green-500 bg-green-100 dark:text-green-100 dark:bg-green-500'
      BLUE_SVG = 'text-blue-500 bg-blue-100 dark:text-blue-100 dark:bg-blue-500'
      TEAL_SVG = 'text-teal-500 bg-teal-100 dark:text-teal-100 dark:bg-teal-500'

      def dashboard(color: '', fa_icon: '', title: '', count: '')
        colors = color_classes(color)
        content_tag(:div, class: "#{colors[:card]} cursor-pointer flex items-center p-4 border border-gray-200 bg-white rounded-lg shadow-xs dark:bg-gray-800 dark:border-gray-700") do
          content_tag(:div, class: "p-3 mr-4 #{colors[:svg]} rounded-full") do
            content_tag(:i, '', class: "h-5 w-7 mt-1 #{fa_icon}")
          end + content_tag(:div) do
            content_tag(:p, title, class: 'mb-2 text-sm font-medium text-gray-600 dark:text-gray-400') + content_tag(:p, count, class: 'text-lg font-semibold text-gray-700 dark:text-gray-200')
          end
        end
      end

      private

      def color_classes(name)
        case name
        when 'orange' then { card: ORANGE_CARD, svg: ORANGE_SVG }
        when 'green' then { card: GREEN_CARD, svg: GREEN_SVG }
        when 'blue' then { card: BLUE_CARD, svg: BLUE_SVG }
        when 'teal' then { card: TEAL_CARD, svg: TEAL_SVG }
        end
      end
    end
  end
end
