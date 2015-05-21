FactoryGirl.define do
  factory :proposal do
    title { Faker::Lorem.words(10) }
    public_description { Faker::Lorem.paragraphs(3) }
    private_description { Faker::Lorem.paragraphs(2) }
    event_section
    user
  end
end
