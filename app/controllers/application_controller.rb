class ApplicationController < ActionController::Base
  include Authentication
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  unless Rails.application.config.consider_all_requests_local
    rescue_from CouchRest::Model::DocumentNotFound, with: :render_not_found
  end

  def render_not_found
    render 'public/404', status: 404
  end

end
