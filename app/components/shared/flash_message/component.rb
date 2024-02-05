# frozen_string_literal: true

module Shared
  module FlashMessage
    # FlashMessage Component
    class Component < BaseViewComponent
      FLASH_CLASS = 'fixed w-full mt-16 px-8 z-9999'
      MESSAGE_DEFAULT = 'lg:w-1/2 flex items-center p-4'
      NOTICE_CLASS = 'text-green-800 dark:text-green-400 rounded-lg bg-green-50 dark:bg-gray-800 border border-green-500 dark:border-green-400 shadow-sm shadow-green-500 dark:shadow-green-400'
      ALERT_CLASS = 'text-red-800 dark:text-red-400 rounded-lg bg-red-50 dark:bg-gray-800 border border-red-500 dark:border-red-400 shadow-sm shadow-red-500 dark:shadow-red-400'
      CROSS_BTN = 'ms-auto mx-1.5 -my-1.5 p-1.5 inline-flex items-center justify-center h-8 w-8 rounded-lg'
      NOTICE_CROSS = 'hover:text-green-50 dark:hover:text-gray-800 hover:bg-green-500 dark:hover:bg-green-400'
      ALERT_CROSS = 'hover:text-green-50 dark:hover:text-gray-800 hover:bg-red-500 dark:hover:bg-red-400'

      def initialize(notice: nil, alert: nil)
        super
        @notice = notice
        @alert = alert
      end

      def call
        return flash_notice if @notice

        return flash_alert if @alert

        ''
      end

      private

      def flash_notice
        content_tag(:div, class: FLASH_CLASS, data: { controller: 'flash_message', action: 'flash_message#init' }) do
          content_tag(:div, class: 'flex justify-center') do
            content_tag(:div, class: "#{MESSAGE_DEFAULT} #{NOTICE_CLASS}", data: { target: 'flash_message.message' }) do
              content_tag(:div, @notice, class: 'ms-3 text-sm font-medium mr-2') + cross_btn(klass: NOTICE_CROSS)
            end
          end
        end
      end

      def flash_alert
        content_tag(:div, class: FLASH_CLASS, data: { controller: 'flash_message' }) do
          content_tag(:div, class: 'flex justify-center') do
            content_tag(:div, class: "#{MESSAGE_DEFAULT} #{ALERT_CLASS}", data: { target: 'flash_message.message' }) do
              content_tag(:div, @alert, class: 'ms-3 text-sm font-medium mr-2') + cross_btn(klass: ALERT_CROSS)
            end
          end
        end
      end

      def cross_btn(klass: '')
        button_tag(type: 'button', class: "#{CROSS_BTN} #{klass}", data: { action: 'click->flash_message#close' }) do
          content_tag(:i, '', class: 'w-4 h-4 fa-solid fa-xmark')
        end
      end
    end
  end
end
