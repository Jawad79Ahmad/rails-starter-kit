# frozen_string_literal: true

module Shared
  module Dropdown
    # Common Dropdown Component
    class Component < BaseViewComponent
      def initialize(name: '', props: {})
        super
        @name = name
        @props = props
        @klass = props[:klass].to_s
        @options = props[:options]
        @button_data = props[:button_data]
      end

      def nav_notifications
        option_klass = 'inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-red-600 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-600'
        @options = [{ klass: 'justify-between', content: content_tag(:span, 'Messages') + content_tag(:span, '13', class: option_klass), url: '#' },
                    { klass: 'justify-between', content: content_tag(:span, 'Sales') + content_tag(:span, '2', class: option_klass), url: '#' },
                    { klass: 'justify-between', content: content_tag(:span, 'Alerts'), url: '#' }]
        svg = content_tag(:i, '', class: 'w-4 h-4 fa-solid fa-bell')
        badge = content_tag(:span, '', class: 'absolute top-0 right-0 inline-block w-3 h-3 transform translate-x-1 -translate-y-1 bg-red-600 border-2 border-white rounded-full dark:border-gray-800')
        self.class.new(name: 'notifications', props: { options: @options, button_data: svg + badge, klass: 'w-56' })
      end
    end
  end
end
