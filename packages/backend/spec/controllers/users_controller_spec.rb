# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    attributes_for(:user)
  end

  let(:invalid_attributes) do
    attributes_for(:user).merge({ password: nil, email: nil })
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.

  describe 'GET #index' do
    it 'returns a success response' do
      user = User.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'when has valid attributes' do
      it 'returns a success response' do
        post :create, params: { user: valid_attributes }, as: :json
        expect(response).to be_successful
      end

      it 'renders show template' do
        post :create, params: { user: valid_attributes }, as: :json
        expect(response).to render_template(:show, as: :json)
      end
    end

    context 'when has invalid attributes' do
      it 'does not return a success response' do
        post :create, params: { user: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
