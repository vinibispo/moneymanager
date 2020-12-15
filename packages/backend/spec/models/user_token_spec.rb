# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserToken, type: :model do
  it 'is invalid if user_token has no user' do
    user_token = build(:user_token, user: nil)
    expect(user_token).not_to be_valid
  end

  it 'is valid if user_token has user' do
    user_token = build(:user_token)
    expect(user_token).to be_valid
  end
end
