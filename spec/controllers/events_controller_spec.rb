require "rails_helper"

RSpec.describe EventsController, type: :controller do
  describe "GET #index" do
    it "responds 200 when visitting" do
      get :index
      expect(response).to have_http_status(200)
    end

    # it "loads events" do
    #   event = Event.new
    #   event.save!(validate: false)
    #   get :index
    #   get(assigns(:events)).to eq [event]
    # end
  end

  # Test method new
  describe "GET #new" do
    it "responds 200 when visitting" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  # Test method create event
  describe "respond to" do
    it "responds to html by default" do
      post :create, { :event => { :name => "Bingo" } }
      expect(response.content_type).to eq "text/html"
    end
  end
end