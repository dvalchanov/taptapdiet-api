class Day < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_many :feelings, dependent: :destroy

  def last_feeling
    feelings.last.value
  end

end

