class User < ApplicationRecord
  default_scope { order(:created_at) }
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_length_of :password, :minimum => 8
end
