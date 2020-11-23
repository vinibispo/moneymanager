# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'describe POST /authentications' do
    it 'returns id of user when user is authenticated in right way' do
      password = FFaker::Internet.password
      user = create(:user, password: password)
      post "#{auth_user_path}.json", params: {
        email: user[:email],
        password: password
      }
      jsonResponse = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(jsonResponse['user']['id']).to eql user[:id]
    end

    it 'returns a error when password does not match' do
      password = FFaker::Internet.password
      user = create(:user)
      post "#{auth_user_path}.json", params: {
        email: user[:email],
        password: password
      }
      jsonResponse = JSON.parse(response.body)
      expect(response).to have_http_status :unauthorized
      expect(jsonResponse['errors']).to eql ['Invalid username/password']
    end

    it 'returns a error when email does not match' do
      email = FFaker::Internet.email
      user = create(:user)
      post "#{auth_user_path}.json", params: {
        email: email,
        password: user[:password]
      }
      jsonResponse = JSON.parse(response.body)
      expect(response).to have_http_status :unauthorized
      expect(jsonResponse['errors']).to eql ['Invalid username/password']
    end
  end
end
