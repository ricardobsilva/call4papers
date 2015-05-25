FactoryGirl.define do
  factory :comment do
    text { Faker::Lorem.paragraphs(1) }
    user
    proposal
  end
end
