class Day < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_many :feelings, dependent: :destroy

end

