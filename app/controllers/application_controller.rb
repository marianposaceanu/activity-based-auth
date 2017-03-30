class User
  attr_accessor :role

  def initialize(role:)
    @role = role.present? ? role : 'simpleton'
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.new(role: params[:role])
  end
end
