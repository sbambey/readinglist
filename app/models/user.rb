class User < ActiveRecord::Base
	extend FriendlyId
  friendly_id :username, use: [:slugged, :history]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :book_requests, dependent: :destroy

  validates :username, presence: true, length: { minimum: 3, maximum: 20 }, uniqueness: true

  def should_generate_new_friendly_id?
    username_changed?
  end
end
