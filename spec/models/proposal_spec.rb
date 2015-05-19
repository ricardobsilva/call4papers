require 'rails_helper'

RSpec.describe Proposal, type: :model do
  it { expect(subject).to validate_presence_of(:title) }
  it { expect(subject).to validate_presence_of(:public_description) }
  it { expect(subject).to validate_presence_of(:private_description) }
  it { expect(subject).to belong_to(:event_section) }
  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to have_many(:comments).dependent(:destroy) }
  it { expect(subject).to have_many(:ratings).dependent(:destroy) }

  it 'has a valid factory' do
    expect(build(:proposal)).to be_valid
  end

  context 'is invalid' do
    it 'without a title' do
      proposal = build(:proposal, title: nil)
      proposal.valid?
      expect(proposal.errors[:title]).to include("can't be blank")
    end

    it 'without a public_description' do
      proposal = build(:proposal, public_description: nil)
      proposal.valid?
      expect(proposal.errors[:public_description]).to include("can't be blank")
    end

    it 'without a private_description' do
      proposal = build(:proposal, private_description: nil)
      proposal.valid?
      expect(proposal.errors[:private_description]).to include("can't be blank")
    end

    it 'without a event_section' do
      proposal = build(:proposal, event_section: nil)
      proposal.valid?
      expect(proposal.errors[:event_section]).to include("can't be blank")
    end

    it 'without a user' do
      proposal = build(:proposal, user: nil)
      proposal.valid?
      expect(proposal.errors[:user]).to include("can't be blank")
    end
  end

  context 'is valid' do
  end

  describe '#percentage' do
    pending 'test #percentage method on Proposal'
  end
end
