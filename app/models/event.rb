class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user

  has_many :event_sections, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :end_date, presence: true
  validates :logo, presence: true
  validates :user, presence: true

  mount_uploader :logo, ImageUploader

  scope :latest, -> { where('created_at >= ?', 7.days.ago) }
  scope :upcoming, -> { where('date >= ? and date <= ?', Date.today, Date.today + 7) }

  def open?
    Date.today <= end_date
  end
end
