FactoryGirl.define do
  factory :day do
    sequence(:id) { |n| "id_#{ n }" }
    user
  end
end
