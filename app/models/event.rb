class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user

  has_many :event_sections, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :logo, presence: true

  mount_uploader :logo, ImageUploader

  def is_open?
    Date.today <= end_date
  end
end
