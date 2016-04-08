module DayGenerator

	class << self
	  def generate
	    User.all.each do |user|
	    	 day = ActiveSupport::TimeZone.new(user.time_zone).now.day
	    	 last_day = user.days.last.created_at.in_time_zone(user.time_zone).day

				unless day == last_day
	    		user.days.create
	    	end
			end
	  end
	end

end
