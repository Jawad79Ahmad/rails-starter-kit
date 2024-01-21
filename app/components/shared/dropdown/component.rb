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

      def nav_profile
        @name = 'profile'
        @options = [
          { content: read_svg(klass: 'w-4 h-4 mr-3', name: 'profile') + content_tag(:span, 'Profile'), url: '#' },
          { content: read_svg(klass: 'w-4 h-4 mr-3', name: 'setting') + content_tag(:span, 'Setting'), url: '#' },
          { content: read_svg(klass: 'w-4 h-4 mr-3', name: 'logout') + content_tag(:span, 'Log out'), url: '#' }
        ]
        @button_data = image_tag('https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=aa3a807e1bbdfd4364d1f449eaa96d82', class: 'object-cover w-8 h-8 rounded-full')
        self.class.new(name: @name, props: { options: @options, button_data: @button_data, klass: 'w-32' })
      end

      def nav_notifications
        option_klass = 'inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-red-600 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-600'
        @options = [{ klass: 'justify-between', content: content_tag(:span, 'Messages') + content_tag(:span, '13', class: option_klass), url: '#' },
                    { klass: 'justify-between', content: content_tag(:span, 'Sales') + content_tag(:span, '2', class: option_klass), url: '#' },
                    { klass: 'justify-between', content: content_tag(:span, 'Alerts'), url: '#' }]
        svg = read_svg(name: 'bell', klass: 'w-5 h-5')
        badge = content_tag(:span, '', class: 'absolute top-0 right-0 inline-block w-3 h-3 transform translate-x-1 -translate-y-1 bg-red-600 border-2 border-white rounded-full dark:border-gray-800')
        self.class.new(name: 'notifications', props: { options: @options, button_data: svg + badge, klass: 'w-56' })
      end
    end
  end
end
