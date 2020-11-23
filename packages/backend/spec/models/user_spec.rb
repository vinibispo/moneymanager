# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid if user has no password' do
    user = build(:user, password: nil)
    expect(user).not_to be_valid
  end

  it 'is valid if user has password filled bigger than 8 characters' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is not valid if user has password filled, but is smaller than 8 characters' do
    user = build(:user, password: FFaker::Internet.password(1, 6))
    expect(user).not_to be_valid
  end

  it 'is not valid if user has no email filled' do
    user = build(:user, email: nil)
    expect(user).not_to be_valid
  end
end
