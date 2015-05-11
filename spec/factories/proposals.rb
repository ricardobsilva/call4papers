FactoryGirl.define do
  factory :proposal do
    title 'MyString'
    public_description 'MyText'
    private_description 'MyText'
    event_section nil
    user nil
  end
end
