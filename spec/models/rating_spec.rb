require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { expect(subject).to validate_presence_of(:proposal) }
  it { expect(subject).to validate_presence_of(:user) }
  # check https://github.com/thoughtbot/shoulda-matchers/issues/535 for later updates on this validation
  # so far is not working. workaround is 'validate uniqueness of user within proposal scope' test
  # it { expect(subject).to validate_uniqueness_of(:user).scoped_to(:proposal_id).with_message('already voted for this proposal') }
  it { expect(subject).to belong_to(:proposal).counter_cache(true) }
  it { expect(subject).to belong_to(:user) }

  it 'has a valid factory' do
    expect(build(:rating)).to be_valid
  end

  it 'validate uniqueness of user within proposal scope' do
    expect(create(:rating)).to validate_uniqueness_of(:user).scoped_to(:proposal_id).with_message('already voted for this proposal')
  end

  context 'is invalid' do
    it 'without a proposal' do
      rating = build(:rating, proposal: nil)
      rating.valid?
      expect(rating.errors[:proposal]).to include("can't be blank")
    end

    it 'without a user' do
      rating = build(:rating, user: nil)
      rating.valid?
      expect(rating.errors[:user]).to include("can't be blank")
    end
  end

  context 'is valid' do
  end

  describe '#percentage' do
    pending 'test #percentage method on Proposal'
  end
end
