class EventSection < ActiveRecord::Base
  belongs_to :event

  has_many :proposals, dependent: :destroy

  validates :name, presence: true
end
