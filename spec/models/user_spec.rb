require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_presence_of(:email) }
  it { expect(subject).to validate_presence_of(:password) }
  it { expect(subject).to have_many(:events).dependent(:destroy) }
  it { expect(subject).to have_many(:proposals).dependent(:destroy) }
  it { expect(subject).to have_many(:ratings).dependent(:destroy) }
  it { expect(subject).to have_many(:comments).dependent(:destroy) }

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  context 'is invalid' do
    it 'without a name' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'without a email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'without a password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
  end

  context 'is valid' do
  end

  describe '#image_url' do
    before(:all) do
      @user = build(:user)
    end

    it 'should return a gravatar url' do
      expect(@user.image_url).to match(/www.gravatar.com/)
    end

    it 'should have a md5 email hash on url' do
      expect(@user.image_url).to match(/#{Digest::MD5.hexdigest(@user.email)}/)
    end
  end
end
