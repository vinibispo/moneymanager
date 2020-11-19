class Transaction < ApplicationRecord
  default_scope { order(:created_at) }
  has_one :category
  enum type: [:income, :outcome]
end
