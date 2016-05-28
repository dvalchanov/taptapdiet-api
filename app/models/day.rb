class Day < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_many :feelings, dependent: :destroy

  scope :ordered, -> { order(created_at: :desc) }

  def last_feeling
    if feelings.size != 0
      feelings.order(created_at: :asc).last.value
    else
      nil
    end
  end

  def search
    @results = Meal.where("title ILIKE ?", params[:title])
  end

end

