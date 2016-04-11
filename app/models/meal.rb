class Meal < ApplicationRecord
  belongs_to :day
  serialize :ingredients, Array

  validates :title, presence: true, uniqueness: true
end
