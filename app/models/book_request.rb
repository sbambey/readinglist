# == Schema Information
#
# Table name: book_requests
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BookRequest < ActiveRecord::Base
	belongs_to :user

	def self.throttled?(user)
		if BookRequest.where("created_at >= ? AND user_id = ?", 1.hour.ago, user.id).count > 30
			return true
		elsif BookRequest.where("created_at >= ? AND user_id = ?", Time.zone.now.beginning_of_day, user.id).count > 100
			return true
		else
			return false
		end
	end
end
