require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "Should return all users" do
      create_list(:user, 10)
      get "#{users_path}.json"
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json.length).to be(10)
    end
    it "should return just a user" do
      user = create(:user)
      get "#{user_path(user.id)}.json"
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json["email"]).to eq user[:email]
    end
  end
end
