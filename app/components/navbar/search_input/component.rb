# frozen_string_literal: true

module Navbar
  module SearchInput
    # SearchInput Component
    class Component < BaseViewComponent
      def call
        content_tag(:div, class: 'relative w-full max-w-xl focus-within:text-cyan-500') do
          content_tag(:div, class: 'absolute inset-y-0 flex items-center pl-2') { search_svg } + search_input_field
        end
      end

      private

      def search_svg
        read_svg(name: 'search', klass: 'w-4 h-4')
      end

      def search_input_field
        text_field_tag :main_search, '', autocomplete: 'off', class: 'w-full pl-8 p-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-cyan-300 focus:outline-none focus:shadow-outline-cyan form-input', placeholder: 'Search for projects'
      end
    end
  end
end
