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
