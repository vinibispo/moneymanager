# frozen_string_literal: true

class AuthenticationController < ApplicationController
  before_action :set_auth
  def create
    auth_response = @auth.perform
    render json: auth_response[:message], status: auth_response[:status]
  end

  private

  def set_auth
    @auth = AuthService.new(params[:email], params[:password])
  end
end
