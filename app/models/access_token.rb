class AccessToken < ApplicationRecord
  validates :token, presence: true
  validates :expires_at, presence: true

  belongs_to :user

  scope :by_date, -> { order(created_at: :desc) }

  before_validation :assign_token, on: :create

  def expired?
    expires_at < Time.zone.now
  end


  private

  def assign_token
    self.token = SecureRandom.hex(32)
    self.expires_at = 1.year.from_now
  end
end
