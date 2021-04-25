class User < ActiveRecord::Base
	self.per_page = 2

	def self.find_matches(str)
		User.where("first_name LIKE ? or last_name LIKE ? or email LIKE ? ", "%#{str}%","%#{str}%","%#{str}%")
	end
end