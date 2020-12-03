# frozen_string_literal: true

class Account < ApplicationRecord
  default_scope { order(:created_at) }
  validates :name, presence: true
  validates :initial_value, presence: true
  validates :user_id, presence: true
  belongs_to :user
end
