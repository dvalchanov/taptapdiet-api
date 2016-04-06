module DayGenerator

	class << self
	  def generate
	    User.all.each do |user|
	    	day = ActiveSupport::TimeZone.new(user.time_zone).now.day
	    	last_day = user.days.last.created_at.day

				unless day == last_day
	    		user.days.create
	    	end
	    	
			end
	  end
	end

end
