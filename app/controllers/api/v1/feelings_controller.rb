class Api::V1::DaysController < Api::BaseController
  def create
    @day = current_user.days.find(params[:day_id])
    @feeling = @day.feelings.create!(feeling_params)

    head :unprocessable_entity if @feeling.errors.present?
  end

  private

    def feeling_params
      params.require(:feeling).permit(:value)
    end

end
