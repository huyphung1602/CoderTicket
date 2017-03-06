require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "respond to" do
    it "responds to html by default" do
      post :create, { :user => { :email => "huy@gmail.com" } }
      expect(response.content_type).to eq "text/html"
    end
  end
end
