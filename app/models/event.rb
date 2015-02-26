class Event < ActiveRecord::Base
  belongs_to :user

  has_many :event_sections, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :logo, presence: true

  mount_uploader :logo, ImageUploader
end
