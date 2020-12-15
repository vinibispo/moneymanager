# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ::Exception, with: :error_occurred

  protected

  def authenticate_request!
    unless user_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[:user_id])
    @current_user
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  private

  def http_token
    @http_token ||= (request.headers['SecureToken'].split.last if request.headers['SecureToken'].present?)
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_s
  end

  def error_occurred(exception)
    if exception.instance_of? AppErrorService
      render json: { message: exception.message }, status: exception.status_code
    else
      render json: { message: exception.message }, status: :internal_server_error
    end
  end
end
