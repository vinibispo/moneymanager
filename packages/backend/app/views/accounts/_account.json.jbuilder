# frozen_string_literal: true

json.extract! account, :id, :name, :initial_value, :user_id, :active, :created_at, :updated_at
json.url "#{account_url(account)}.json"
