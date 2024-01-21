# frozen_string_literal: true

module Sidebar
  module SubMenu
    # Sidebar Sub Menu Component
    class Component < BaseViewComponent
      def initialize(name: '', links: [])
        super
        @name = name.underscore.gsub(' ', '_') # is menu title
        @links = links # is array of objects that contains sub menu title and url as {title: xyz, url: any_path}
      end
    end
  end
end
