class User
  attr_accessor :role

  def initialize(role:)
    @role = role.present? ? role : 'simpleton'
  end

  def roles
    Role.where(name: role)
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.new(role: params[:role])
  end

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  # rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  private

  def permission_denied
    head 403
  end
end
