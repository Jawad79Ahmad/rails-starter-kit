# frozen_string_literal: true

module Navbar
  module SearchInput
    # SearchInput Component
    class Component < BaseViewComponent
      def call
        content_tag(:div, class: 'relative w-full max-w-xl focus-within:text-cyan-700 hidden lg:block') do
          content_tag(:div, class: 'absolute inset-y-0 flex items-center pl-2') { search_svg } + search_input_field
        end
      end

      private

      def search_svg
        content_tag(:i, '', class: 'w-3 h-3 fa-solid fa-search')
      end

      def search_input_field
        text_field_tag :main_search, '', autocomplete: 'off', class: 'w-full pl-8 p-2 text-sm text-gray-700 bg-inherit placeholder-gray-600 rounded-md focus:border dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:text-gray-200 focus:placeholder-gray-500 focus:border-cyan-700 focus:outline-none focus:shadow-outline-cyan form-input', placeholder: 'Search for projects'
      end
    end
  end
end
