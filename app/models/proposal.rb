class Proposal < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope { order(ratings_count: :desc) }

  belongs_to :event_section
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :title, presence: true
  validates :public_description, presence: true
  validates :private_description, presence: true
  validates :event_section, presence: true
  validates :user, presence: true

  def percentage
    ratings_count.to_f / event_section.total_ratings * 100
  end
end
