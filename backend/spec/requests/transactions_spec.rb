require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  describe "GET /transactions" do
    it "should have status 401 when is not authenticated" do
      get "#{transactions_path}.json"
      expect(response).to have_http_status(401)
    end
  end
end
