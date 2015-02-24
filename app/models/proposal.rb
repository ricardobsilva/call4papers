class Proposal < ActiveRecord::Base
  belongs_to :event_section
  belongs_to :user

  has_many :comments, dependent: :destroy
end
