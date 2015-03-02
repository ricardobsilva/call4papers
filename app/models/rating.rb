class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal, counter_cache: true

  validates :proposal, presence: true
  validates :user, presence: true, uniqueness: { scope: :proposal, message: "already voted for this proposal" }
end
