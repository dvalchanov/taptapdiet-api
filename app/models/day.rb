class Day < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_many :feelings, dependent: :destroy

  scope :ordered, -> { order(created_at: :desc) }
  scope :search, -> (title) { where('title ILIKE ?', "%#{title.downcase}%") }
  scope :limit_and_offset, -> (limit, offset) { limit(limit).offset(offset) }

  def last_feeling
    feelings.order(created_at: :asc).last.try(:value) unless feelings.size == 0
  end
end

