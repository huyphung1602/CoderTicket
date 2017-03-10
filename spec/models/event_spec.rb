require 'rails_helper'

RSpec.describe Event, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "#save" do
    it "can save with valid params" do
      event = build(:event)
      event.save!
      expect(event).to be_persisted
    end
  end

  describe ".published_and_upcoming" do
    it "returns [] empty where there ise no event" do
      expect(Event.published_and_upcoming).to eq []
    end

    it "returns 1 event when there is 1 event" do
      event = Event.new(starts_at: 1.day.from_now, published_at: 1.day.ago)
      event.save(validate: false)
      expect(Event.published_and_upcoming).to eq [event]
    end

    it "returns only 1 (1 published but 2 upcoming events)" do
      a = Event.new(starts_at: 1.day.ago)
      b = Event.new(starts_at: 1.day.from_now, published_at: 1.day.ago)
      c = Event.new(starts_at: Date.parse('2017/12/3'))

      a.save!(validate: false)
      b.save!(validate: false)
      c.save!(validate: false)

      expect(Event.published_and_upcoming).to match_array [b]
    end

    it "returns only 2 published and upcoming events" do
      a = Event.new(starts_at: 1.day.ago)
      b = Event.new(starts_at: 1.day.from_now, published_at: 1.day.ago)
      c = Event.new(starts_at: Date.parse('2017/12/3'), published_at: 1.month.ago)

      a.save!(validate: false)
      b.save!(validate: false)
      c.save!(validate: false)

      expect(Event.published_and_upcoming).to match_array [c, b]
    end

    it "returns only 1 published event is upcoming events" do
      a = Event.new(starts_at: 1.month.ago, published_at: 3.month.ago)
      b = Event.new(starts_at: 5.day.ago, published_at: 1.month.ago)
      c = Event.new(starts_at: Date.parse('2016/03/20'), published_at: Date.parse('2016/03/5'))
      d = Event.new(starts_at: 1.day.from_now, published_at: 10.day.ago)

      a.save!(validate: false)
      b.save!(validate: false)
      c.save!(validate: false)
      d.save!(validate: false)

      expect(Event.published_and_upcoming).to match_array [d]
    end
  end

  describe "#venue_name" do
    let(:event) { Event.new }
    let(:venue) { Venue.new name: "GEM center" }

    it "returns nil if there is no value" do
      expect(event.venue_name).to eq nil
    end

    it "returns venue name" do
      event.venue = venue
      expect(event.venue_name).to eq "GEM center"
    end
  end

  describe "#to_param" do
    it "returns beautiful name" do
      event = Event.new(name: "Color Me Run", id: 1)
      expect(event.to_param).to eq "1-color-me-run"
    end
  end

  describe ".search" do
    it "returns no result" do
      event = Event.new(name: "Saigon Soul pool party")
      event.save!(validate: false)

      expect(Event.search("Ha Noi")).to eq []
    end

    it "returns 1 search result" do
      event = Event.new(name: "Saigon Soul pool party")
      event.save!(validate: false)

      expect(Event.search("pool")).to eq [event]
    end

    it "returns the 2 search result in total 6 events" do
      a = Event.new(name: "Saigon Soul pool party")
      b = Event.new(name: "Color me run Ha Noi")
      c = Event.new(name: "Ionah Show")
      d = Event.new(name: "Color me run Saigon")
      e = Event.new(name: "Dan Truong Show")
      f = Event.new(name: "Coderschool Demo Day")

      a.save!(validate: false)
      b.save!(validate: false)
      c.save!(validate: false)
      d.save!(validate: false)
      e.save!(validate: false)
      f.save!(validate: false)

      expect(Event.search("Saigon")).to eq [a, d]
    end
  end
end
