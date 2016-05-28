class Api::V1::DaysController < Api::BaseController
	def index
    limit = (params[:limit] || 10).to_i
    offset = (params[:offset] || 0).to_i
    if params[:title]
      title = params[:title]
      @days = current_user.days.limit(limit).offset(offset).ordered.joins(:meals).uniq.where(meals: {title: params[:title]})
    else
      @days = current_user.days.limit(limit).offset(offset).ordered
    end
	end
end
