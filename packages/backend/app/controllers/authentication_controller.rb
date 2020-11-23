# frozen_string_literal: true

class AuthenticationController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: payload(user)
    else
      render json: { errors: ['Invalid username/password'] }, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user&.id

    {
      auth_token: JsonWebToken.encode({ user_id: user.id }),
      user: { id: user.id, email: user.email }
    }
  end
end
