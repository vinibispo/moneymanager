# frozen_string_literal: true

class User < ApplicationRecord
  default_scope { order(:created_at) }
  has_secure_password
  has_many :accounts, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }
  enum status: { common: 0, payd_out: 1, admin: 2 }
end
