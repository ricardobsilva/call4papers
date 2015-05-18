require 'rails_helper'

RSpec.describe Event, type: :model do
  it { expect(subject).to validate_presence_of(:name) }
  it { expect(subject).to validate_presence_of(:description) }
  it { expect(subject).to validate_presence_of(:date) }
  it { expect(subject).to validate_presence_of(:end_date) }
  it { expect(subject).to validate_presence_of(:logo) }
  it { expect(subject).to belong_to(:user) }

  it 'has a valid factory' do
    expect(build(:event)).to be_valid
  end

  context 'is invalid' do
    it 'without a name' do
      event = build(:event, name: nil)
      event.valid?
      expect(event.errors[:name]).to include("can't be blank")
    end

    it 'without a description' do
      event = build(:event, description: nil)
      event.valid?
      expect(event.errors[:description]).to include("can't be blank")
    end

    it 'without a date' do
      event = build(:event, date: nil)
      event.valid?
      expect(event.errors[:date]).to include("can't be blank")
    end

    it 'without a end_date' do
      event = build(:event, end_date: nil)
      event.valid?
      expect(event.errors[:end_date]).to include("can't be blank")
    end

    it 'without a logo' do
      event = build(:event, logo: nil)
      event.valid?
      expect(event.errors[:logo]).to include("can't be blank")
    end
  end

  context 'is valid' do
    it 'without a url' do
      event = build(:event, url: nil)
      event.valid?
      expect(event.errors[:url]).to be_empty
    end
  end

  context 'scope' do
    before(:all) do
      Timecop.freeze(Time.now)
      create(:event, date: Date.tomorrow, created_at: Time.now - 30.days)
      create(:event, date: Date.yesterday, created_at: Time.now - 8.days)
      create(:event, date: Date.today + 7, created_at: Time.now - 5.days)
      create(:event, date: Date.today + 8, created_at: Time.now - 7.days)
    end

    after(:all) do
      Event.all.each { |e| e.destroy }
      Timecop.return
    end

    it 'upcoming should return events from next 7 days' do
      events = Event.upcoming
      expect(events.count).to equal 2
    end

    it 'latest should return events from last 7 days' do
      events = Event.latest
      expect(events.count).to equal 2
    end
  end

  context 'is open' do
    before(:all) do
      @event1 = create(:event, end_date: Date.tomorrow)
      @event2 = create(:event, end_date: Date.today)
      @event3 = create(:event, end_date: Date.yesterday)
    end

    after(:all) do
      @event1.destroy
      @event2.destroy
      @event3.destroy
    end

    it 'if end date is in the future' do
      expect(@event1.open?).to equal true
      expect(@event2.open?).to equal true
      expect(@event3.open?).to equal false
    end
  end
end
