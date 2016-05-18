FactoryGirl.define do
  factory :meal do
    sequence(:title) { |n| "title_#{ n }"}
    sequence(:id) { |n| "id_#{ n }"}
    day
  end
end