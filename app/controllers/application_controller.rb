# frozen_string_literal: true

# All classes with inherit from ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
