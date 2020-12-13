# frozen_string_literal: true

# That class sends email related for user or send a user for another job processing
class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup.subject
  #
  def signup(user_id)
    @user = User.find(user_id)
    mail to: @user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.forgot_password.subject
  #
  def forgot_password
    @greeting = 'Hi'

    mail to: 'to@example.org'
  end
end
