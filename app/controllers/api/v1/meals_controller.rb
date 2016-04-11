class Api::V1::MealsController < Api::BaseController

  def create
    @day = current_user.days.find(params[:id])
    @meal = @day.meals.create!(meal_params)
    head :unprocessable_entity if @meal.errors.present?
  end

  def update
    @day = current_user.days.find(params[:id])
    @meal = @day.meals.find(params[:id])
    @meal.update(meal_params)

    head :unprocessable_entity if @meal.errors.present?
  end

  def destroy
    day = current_user.days.find(params[:id])
    meal = day.meals.find(params[:id])
    meal.destroy!
    head :no_content
  end

  private

    def meal_params
      params.require(:meal).permit(:title, :image)
    end
end