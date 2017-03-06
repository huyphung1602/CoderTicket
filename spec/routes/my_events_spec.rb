require 'rails_helper'

RSpec.describe "routing to /events/my", type: 'routing' do
  it "should go to events#my_events" do
    expect(get: "/events/my").to route_to(controller: "events", action: "my_events")
  end
end