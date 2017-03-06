require 'rails_helper'

RSpec.describe "routing to /events/1/publish", type: 'routing' do
  it "should go to events#have_enough_ticket_types?" do
    expect(post: "/events/1/publish").to route_to(controller: "events", action: "have_enough_ticket_types?", id: "1")
  end
end