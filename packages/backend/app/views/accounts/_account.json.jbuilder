# frozen_string_literal: true

json.extract! account, :id, :name, :initial_value, :user_id, :active, :created_at, :updated_at
json.url user_account_url(account[:user_id], account, format: :json)
