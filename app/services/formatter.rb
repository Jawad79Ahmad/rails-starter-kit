# frozen_string_literal: true

# Formatter
class Formatter
  def self.date(date)
    date.strftime('%a, %d %b %Y')
  rescue StandardError
    ''
  end

  def self.datetime(date)
    date.strftime('%a, %d %b %Y %I:%M %p')
  rescue StandardError
    ''
  end
end
