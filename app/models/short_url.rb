# == Schema Information
#
# Table name: short_urls
#
#  id         :integer          not null, primary key
#  slug       :string
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortUrl < ActiveRecord::Base
	extend FriendlyId

	friendly_id :short_url, use: [:history]
	
	belongs_to :list

	def short_url
		begin
	    short_url = "#{SecureRandom.hex(3)}"
	  end while self.class.exists?(slug: short_url)
	  return short_url
	end
end
