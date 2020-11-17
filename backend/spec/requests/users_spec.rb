require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      create_list(:user, 10)
      get "#{users_path}.json"
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json.length).to be(10)
    end
  end
end
