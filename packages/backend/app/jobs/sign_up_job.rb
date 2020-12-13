# frozen_string_literal: true

# Job responsible for send email for a user when user is accessing application for the first time
class SignUpJob < ApplicationJob
  queue_as :default

  def perform(id)
    UserMailer.signup(id).deliver_now
    id
  end
end
