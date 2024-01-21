# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  before_action :set_current

  def set_current
    Current.request = request
  end
end
