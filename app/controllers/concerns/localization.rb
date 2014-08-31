module Localization
  extend ActiveSupport::Concern

  included do
    before_action :set_session_locale
    before_action :set_locale
  end

  private

  def set_session_locale
    session[:locale] = params[:locale] if params[:locale]
  end

  def set_locale
    I18n.locale = session[:locale] || locale_from_accept_language_header || I18n.default_locale
  end

  def locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

end
