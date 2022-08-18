require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /next" do
    it "returns http success" do
      get "/next"
      expect(response).to have_http_status(:success)
    end
  end

end