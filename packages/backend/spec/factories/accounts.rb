# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    name { 'MyString' }
    initial_value { 1.5 }
    user { nil }
    active { false }
  end
end
