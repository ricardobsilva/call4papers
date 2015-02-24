class EventSection < ActiveRecord::Base
  belongs_to :event

  has_many :proposals, dependent: :destroy
end
