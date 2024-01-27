# frozen_string_literal: true

# Formatter
class Formatter
  def self.date_for_view(date)
    date.strftime('%a, %d %b %Y %I:%M %p')
  rescue StandardError
    ''
  end
end
