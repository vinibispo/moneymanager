require 'rails_helper'

RSpec.describe "Accounts", type: :request do
  describe "GET /accounts" do
    it "should get unauthorized when has no user" do
      get accounts_path
      expect(response).to have_http_status(401)
    end
  end
end
