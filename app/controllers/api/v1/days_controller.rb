class Api::V1::DaysController < Api::BaseController
	def index
    @days = current_user.days.limit(params[:limit].to_i || 10).offset(params[:offset].to_i || 0)
	end
end