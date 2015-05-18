FactoryGirl.define do
  factory :event_section do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraphs(2) }
    event
  end
end
