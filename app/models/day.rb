class Day < ApplicationRecord
  belongs_to :user
  has_many :meals
  has_many :evaluations


  def average_rating
    ratings = evaluations.pluck(:rating)
    size = ratings.size
    sum = ratings.reduce(0, :+)
    sum/(size-1)
  end
end

