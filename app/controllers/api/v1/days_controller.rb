class Api::V1::DaysController < Api::BaseController
	def index
    limit = (params[:limit] || 10).to_i
    offset = (params[:offset] || 0).to_i
    @days = current_user.days.limit(limit).offset(offset).order(created_at: :desc)
	end
end
