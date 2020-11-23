# frozen_string_literal: true

class Account < ApplicationRecord
  default_scope { order(:created_at) }
  belongs_to :user
end
