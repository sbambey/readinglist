class List < ActiveRecord::Base
	extend FriendlyId
	include PgSearch

  friendly_id :name, use: [:slugged, :history]

  multisearchable against: [:name, :description]

	belongs_to :user
	has_many :list_items, dependent: :destroy
  has_one :short_url, dependent: :destroy

	accepts_nested_attributes_for :list_items, allow_destroy: true

  validates :name, presence: true, length: { minimum: 3, maximum: 60 }
  #validates :description, presence: true, length: { minimum: 10, maximum: 100 }

	def should_generate_new_friendly_id?
    name_changed?
  end

  def self.search(search)
  	if search
  		PgSearch.multisearch(search)
  	else
      order("created_at DESC")
  	end
  end
end
