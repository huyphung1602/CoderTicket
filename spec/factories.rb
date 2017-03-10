FactoryGirl.define do
  factory :region do
    name "Ha Noi"
  end

  factory :venue do
    name "venue"
    full_address "address"
    region
  end

  factory :event do
    extended_html_description "..."
    name "Valid Event"
    starts_at 1.day.from_now
    venue
    category
  end

  factory :category do
    name "Entertainment"
  end
end
