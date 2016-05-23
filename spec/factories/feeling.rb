FactoryGirl.define do 
  factory :feeling do
    sequence(:value) { |n| "value_#{ n }" }
    day
  end
end