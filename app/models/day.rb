class Day < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_many :evaluations, dependent: :destroy


  def average_rating
    ratings = evaluations.pluck(:rating)
    size = ratings.size
    sum = ratings.reduce(0, :+)
    sum/size unless size == 0
  end
end

