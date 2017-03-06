require 'rails_helper'

RSpec.describe "events/index.html.erb", type: :view do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'display events' do
    venue = Venue.new(:id => 1, :name => "Nha Hat Lon HCM",
                      :full_address => "Quan 1 HCM")

    venue.save!(validate: false)

    a = Event.new(:name => "Kich Sai Gon Dep Lam",
                  :starts_at => Time.now, :venue_id => venue.id)
    b = Event.new(:name => "Ha Anh Tuan Live Show",
                  :starts_at => 10.day.from_now, :venue_id => venue.id)

    a.save!(validate: false)
    b.save!(validate: false)

    assign(:events, [a, b])
    render

    expect(rendered).to include 'Kich Sai Gon Dep Lam'
    expect(rendered).to include 'Ha Anh Tuan Live Show'
  end

  it "displays all partials of the events" do
    venue = Venue.new(:id => 1, :name => "Nha Hat Lon HCM",
                      :full_address => "Quan 1 HCM")

    venue.save!(validate: false)

    a = Event.new(:name => "Kich Sai Gon Dep Lam",
                  :starts_at => Time.now, :venue_id => venue.id)
    b = Event.new(:name => "Ha Anh Tuan Live Show",
                  :starts_at => 10.day.from_now, :venue_id => venue.id)

    a.save!(validate: false)
    b.save!(validate: false)

    assign(:events, [a, b])
    render

    expect(view).to render_template(partial: '_card', count: 2)
  end
end
