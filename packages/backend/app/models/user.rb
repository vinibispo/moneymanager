# frozen_string_literal: true

class User < ApplicationRecord
  default_scope { order(:created_at) }
  has_secure_password
  has_many :accounts, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }
end
