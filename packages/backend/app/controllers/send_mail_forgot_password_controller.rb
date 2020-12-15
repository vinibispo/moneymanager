# frozen_string_literal: true

# controller for send email of forgot password
class SendMailForgotPasswordController < ApplicationController
  before_action :set_user
  def create
    SendMailForgotPasswordJob.perform_later(@user.id)
    render json: { message: 'Estamos enviando um email para você' }, status: :ok
  end

  private

  def set_user
    @user = User.find_by!(email: params[:email])
    raise AppErrorService.new('Usuário não existe', :not_found) if @user.blank?
  end
end
