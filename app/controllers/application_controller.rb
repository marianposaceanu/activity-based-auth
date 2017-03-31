class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if params[:role].present?
      session[:role] = params[:role]
    end

    User.new(role: session[:role])
  end

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  private

  def permission_denied
    render plain: '403 Forbidden', status: 403 
  end
end
