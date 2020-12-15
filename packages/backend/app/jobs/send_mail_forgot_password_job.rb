# frozen_string_literal: true

# class for send email for forgot password
class SendMailForgotPasswordJob < ApplicationJob
  queue_as :default

  def perform(id)
    UserMailer.forgot_password(id).deliver_now
    id
  end
end
