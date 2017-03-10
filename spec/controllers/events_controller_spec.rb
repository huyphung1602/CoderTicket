require 'pry'
require "rails_helper"

RSpec.describe EventsController, type: :controller do
  def valid_event_params
    {
      extended_html_description: "...",
      venue_id: Venue.first.try(:id) || FactoryGirl.create(:venue).id,
      category_id: Category.first.try(:id) || FactoryGirl.create(:category).id,
      name: "Valid Event",
      starts_at: 1.day.from_now
    }
  end

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
    it "render new if event params aren't valid" do
      post :create, params: { :event => { :name => "Bingo" } }
      expect(response.content_type).to eq "text/html"
      expect(response).to render_template('new')
    end

    it "redirects to root_path if event can be created" do
      post :create, params: { :event => valid_event_params }
      expect(response.content_type).to eq "text/html"
      event = assigns(:event)
      expect(response).to redirect_to(root_path)
    end
  end
end
