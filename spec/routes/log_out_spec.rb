require 'rails_helper'

RSpec.describe "routing to /log_out", type: 'routing' do
  it "should go to sessions#destroy" do
    expect(delete: "/log_out").to route_to(controller: "sessions", action: "destroy")
  end
end