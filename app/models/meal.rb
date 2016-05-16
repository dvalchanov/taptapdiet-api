class Meal < ApplicationRecord
  belongs_to :day
  serialize :ingredients, Array
end
