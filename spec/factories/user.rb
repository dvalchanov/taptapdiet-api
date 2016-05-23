FactoryGirl.define do
  factory :user do
    sequence(:fb_token) { |n| "fb_token_#{ n }" }
    sequence(:fb_user_id) { |n| "fb_user_id_#{ n }" }
    time_zone { "Europe/Athens" }
    fb_token_expiration_date { 3.months.from_now }
  end
end
