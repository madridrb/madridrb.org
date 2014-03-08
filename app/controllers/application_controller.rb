class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  unless Rails.application.config.consider_all_requests_local
    rescue_from CouchRest::Model::DocumentNotFound, with: :render_not_found
  end

  helper_method :current_user, :user_signed_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end

  def render_not_found
    render 'public/404', status: 404
  end

end
