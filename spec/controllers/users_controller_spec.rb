require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "respond to" do
    it "responds to html by default" do
      post :create, { :user => { :name => "huyphung" } }
      expect(response.content_type).to eq "text/html"
    end
  end

end
