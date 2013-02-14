FactoryGirl.define do
  factory :reservation do
    association :user
    association :room
    check_in Time.now
    check_out (Time.now + 2.days)
  end
end