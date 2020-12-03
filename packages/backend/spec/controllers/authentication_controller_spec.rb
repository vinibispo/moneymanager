# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe 'POST #create' do
    it 'has authenticated user' do
      password = FFaker::Internet.password(8)
      user = create(:user, password: password)
      post :create, params: { email: user[:email], password: password }
      expect(response).to be_successful
    end

    it 'does not have authenticated user' do
      user = create(:user)
      post :create, params: { email: user[:email], password: nil }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
