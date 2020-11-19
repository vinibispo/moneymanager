require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    it "works! (now write some real specs)" do
      get "#{categories_path}.json"
      expect(response).to have_http_status(401)
    end
  end
end
