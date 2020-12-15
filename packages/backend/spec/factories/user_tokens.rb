# frozen_string_literal: true

FactoryBot.define do
  factory :user_token do
    user { build(:user) }
    token { SecureRandom.uuid }
  end
end
