FactoryGirl.define do
  factory :reservation do
    association :user
    association :room
    check_in Date.today
    check_out (Date.today + 1.days)
  end
end