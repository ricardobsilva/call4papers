require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { expect(subject).to validate_presence_of(:text) }
  it { expect(subject).to validate_presence_of(:user_id) }
  it { expect(subject).to validate_presence_of(:proposal_id) }
  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to belong_to(:proposal) }

  it 'has a valid factory' do
    expect(build(:comment)).to be_valid
  end

  context 'is invalid' do
    it 'without a text' do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end
  end

  context 'is invalid' do
    it 'whitout a user_id' do
      comment = build(:comment, user_id: nil)
      comment.valid?
      expect(comment.errors[:user_id]).to include("can't be blank")
    end
  end

  context 'is invalid' do
    it 'whitout a proposal_id' do
      comment = build(:comment, proposal_id: nil)
      comment.valid?
      expect(comment.errors[:proposal_id]).to include("can't be blank")
    end
  end
end
