# frozen_string_literal: true

module Shared
  module Breadcrumb
    # Breadcrumb Component
    class Component < BaseViewComponent
      def initialize(options: [], last_option: '')
        super
        @options = options # array of objects that contains title and url as {title: display title, url: any_path}
        @last_option = last_option # only contain string value as current page action name
      end

      def call
        content_tag(:div, class: 'flex px-5 py-3 border text-sm -mt-2 text-gray-600 dark:text-gray-300 border-gray-200 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700', aria: { label: 'Breadcrumb' }) do
          content_tag(:ol, class: 'inline-flex items-center space-x-1 md:space-x-2 rtl:space-x-reverse') do
            dashboard_option + generate_lis(@options).join.html_safe + last_li(@last_option)
          end
        end + content_tag(:hr, '', class: 'border-gray-200 dark:border-gray-700 my-4')
      end

      private

      def dashboard_option
        dashboard_name = 'Dashboard'
        content_tag(:li, class: 'inline-flex items-center') do
          link_to(dashboard_path, class: 'inline-flex items-center font-medium hover:text-gray-800 dark:hover:text-white') do
            content_tag(:i, '', class: 'w-4 h-4 me-2.5 fa-solid fa-house') + dashboard_name
          end
        end
      end

      def last_li(last_option)
        return '' if last_option.blank?

        content_tag(:li, aria: { current: 'page' }) do
          content_tag(:div, class: 'flex items-center') do
            arrow_right + content_tag(:span, last_option, class: 'ms-1 font-medium text-gray-500 md:ms-2 disabled pointer-events-none')
          end
        end
      end

      def generate_lis(options)
        options.map do |option|
          content_tag(:li) do
            content_tag(:div, class: 'flex items-center') do
              option_url = link_to option[:title], option[:url], class: 'ms-1 font-medium hover:text-gray-800 md:ms-2 dark:hover:text-white'
              arrow_right + option_url
            end
          end
        end
      end

      def arrow_right
        content_tag(:i, '', class: 'block w-4 h-4 text-gray-400 fa-solid fa-angle-right')
      end
    end
  end
end
