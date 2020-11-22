require 'rails_helper'

RSpec.describe User, type: :model do
  it "should be invalid if user has no password" do
    user = build(:user, password: nil)
    expect(user).to_not be_valid
  end
  it "should be valid if user has password filled bigger than 8 characters" do
    user = build(:user)
    expect(user).to be_valid
  end
  it "should not be valid if user has password filled, but is smaller than 8 characters" do
    user = build(:user, password: FFaker::Internet.password(1,6))
    expect(user).to_not be_valid
  end
  it "should not be valid if user has no email filled" do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end
end
