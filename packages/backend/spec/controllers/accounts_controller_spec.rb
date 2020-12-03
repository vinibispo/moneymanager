# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:password) do
    FFaker::Internet.password(8, 20)
  end
  let(:user) do
    create(:user, password: password)
  end
  let(:valid_attributes) do
    { name: FFaker::Internet.name, initial_value: rand(0..2000), active: [true, false].sample, user_id: user[:id] }
  end
  let(:auth) do
    AuthService.new(user[:email], password).perform
  end

  let(:invalid_attributes) do
    { name: nil, initial_value: nil, active: nil }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AccountsController. Be sure to keep this updated too.

  describe 'GET #index' do
    it 'returns a success response' do
      account = Account.create! valid_attributes
      request.headers['SecureToken'] = auth[:message][:auth_token]
      get :index, params: { user_id: user[:id] }, as: :json
      expect(response).to be_successful
      expect(assigns(:accounts)).to eq([account])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      account = Account.create! valid_attributes
      request.headers['SecureToken'] = auth[:message][:auth_token]
      get :show, params: { id: account.to_param, user_id: user[:id] }, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Account' do
        expect do
          request.headers['SecureToken'] = auth[:message][:auth_token]
          post :create, params: { account: valid_attributes, user_id: user[:id] }, as: :json
        end.to change(Account, :count).by(1)
      end

      it 'renders a JSON response with the new account' do
        request.headers['SecureToken'] = auth[:message][:auth_token]
        post :create, params: { account: valid_attributes, user_id: user[:id] }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to include('application/json')
        expect(response.location).to eq(user_account_url(user[:id], Account.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new account' do
        request.headers['SecureToken'] = auth[:message][:auth_token]
        post :create, params: { account: invalid_attributes, user_id: user[:id] }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to include('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested account' do
      account = Account.create! valid_attributes
      expect do
        request.headers['SecureToken'] = auth[:message][:auth_token]
        delete :destroy, params: { id: account.to_param, user_id: user[:id] }, as: :json
      end.to change(Account, :count).by(-1)
    end
  end
end
