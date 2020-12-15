# frozen_string_literal: true

class UserToken < ApplicationRecord
  belongs_to :user
  before_save -> { self.token = SecureRandom.uuid }
  default_scope { order(:created_at) }
end
