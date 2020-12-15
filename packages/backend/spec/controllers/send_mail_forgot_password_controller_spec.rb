# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SendMailForgotPasswordController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST#create' do
    it 'sends a mail for redefining password' do
      post :create, params: { email: user.email }, as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'returns a message saying that there is an email' do
      post :create, params: { email: user.email }, as: :json
      response_body = JSON.parse(response.body)
      expect(response_body['message']).to eq('Estamos enviando um email para você')
    end

    it 'throws all' do
      post :create, params: { email: StandardError }, as: :json
      expect(response).to have_http_status(:internal_server_error)
    end
  end
end
