# frozen_string_literal: true

module Backdrop
  # Backdrop Component
  class Component < BaseViewComponent
    def initialize(name: '', z_class: '')
      super
      @name = "#{name}-backdrop"
      @z_class = z_class
    end

    def call
      klass_list = "#{@name} #{@z_class} hidden fixed inset-0 items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"
      content_tag(:div, '', class: klass_list).html_safe
    end
  end
end
