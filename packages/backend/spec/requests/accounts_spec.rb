# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Accounts', type: :request do
  describe 'GET /accounts' do
    it 'gets unauthorized when has no user' do
      get user_accounts_path(1)
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
