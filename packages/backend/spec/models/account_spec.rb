# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'when has no user' do
    it 'does not create a account without user' do
      account = build(:account)
      expect(account).not_to be_valid
    end
  end

  context 'when has user' do
    let(:user) { create(:user) }

    it 'creates a account with user valid' do
      account = build(:account, user_id: user[:id])
      expect(account).to be_valid
    end
  end
end
