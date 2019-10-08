require 'net/https'
require 'uri'

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  RECAPTCHA_MINIMUM_SCORE = 0.5
  RECAPTCHA_ACTION = 'login'

  def verify_recaptcha?(token)
    secret_key = Rails.application.credencials.recaptcha[:secret_key]
    uri = URI.parse("https://www.google.com/recaptcha/api/siteverify?secret=#{secret_key}&response=#{token}")
    r = Net::HTTP.get_response(uri)
    j = JSON.parse(r.body)
    j['success'] && j['score'] > RECAPTCHA_MINIMUM_SCORE && j['action'] == RECAPTCHA_ACTION
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
