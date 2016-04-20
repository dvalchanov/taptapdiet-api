class User < ApplicationRecord
	validates :fb_token, presence: true
  validates :fb_user_id, presence: true
  validates :fb_token_expiration_date, presence: true

	has_many :access_tokens
  has_many :days, dependent: :destroy

  after_create :create_first_day

	class << self
		def create_from_facebook!(params)
			user = find_or_initialize_by(fb_user_id: params[:fb_user_id])
			new_record = user.new_record?

			user.time_zone = params[:time_zone]
			user.fb_token = params[:fb_token]
			user.fb_token_expiration_date = params[:fb_token_expiration_date]
			[user.tap(&:save!), new_record]
		end
	end

	def create_first_day
     days.create!
	end
end



#ActiveSupport::TimeZone.new(user.time_zone).now.hour
