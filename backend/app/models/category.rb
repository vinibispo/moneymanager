class Category < ApplicationRecord
  default_scope { order(:created_at) }
end
