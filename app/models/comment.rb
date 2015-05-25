class Comment < ActiveRecord::Base
  validates :text, :user_id, :proposal_id, presence: true
  belongs_to :user
  belongs_to :proposal
end
