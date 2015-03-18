class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :proposals, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def image_url
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?s=97&d=#{[:mm, :wavatar, :retro, :monsterid, :identicon].sample}"
  end
end
