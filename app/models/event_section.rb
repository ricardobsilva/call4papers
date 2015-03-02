class EventSection < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :event

  has_many :proposals, dependent: :destroy

  validates :name, presence: true
end
