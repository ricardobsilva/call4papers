require 'rails_helper'

RSpec.describe EventSection, type: :model do
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_presence_of(:event) }
  it { expect(subject).to belong_to(:event) }
  it { expect(subject).to have_many(:proposals).dependent(:destroy) }

  it 'has a valid factory' do
    expect(build(:event_section)).to be_valid
  end

  context 'is invalid' do
    it 'without a name' do
      event_section = build(:event_section, name: nil)
      event_section.valid?
      expect(event_section.errors[:name]).to include("can't be blank")
    end
  end

  context 'is valid' do
    it 'without a description' do
      event_section = build(:event_section, description: nil)
      event_section.valid?
      expect(event_section.errors[:description]).to be_empty
    end
  end

  describe "#total_ratings" do
    pending "test #total_ratings method on EventSection"
  end
end
