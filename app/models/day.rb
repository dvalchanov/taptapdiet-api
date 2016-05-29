class Day < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_many :feelings, dependent: :destroy

  scope :ordered, -> { order(created_at: :desc) }
  scope :search, -> (title) { where('title LIKE ?', "%#{title}%") }

  def last_feeling
    if feelings.size != 0
      feelings.order(created_at: :asc).last.value
    else
      nil
    end
  end



end

