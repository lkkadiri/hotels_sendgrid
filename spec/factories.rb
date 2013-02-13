# Let's just save all this as /test/factories
FactoryGirl.define do
  factory :hotel do
    name 'Test Hotel'
    address '500 Braodway'
    city 'Dever'
    state 'CO'
    phone '4544544545'
    email 'lk@lk.com'
    website 'testhotel.com'
    pool true
    gym true
    hot_tub true
    free_breakfast true
  end
  
  factory :room do
    name 'Test Room'
    bedrooms 2
    beds 2
    nightly_rate 100
    television true
    fridge true
    microwave true
    smoke_free true
    sauna false
  end
  factory :user do
    sequence(:username)               { |n| "test_name_#{n}"}
    sequence(:email)                  { |n| "user_#{n}@example.com"}
    sequence(:organization_name)                  { |n| "test_name_#{n}"}
    password               "password"
    password_confirmation  "password"
    confirmed_at "2011-10-05 10:34:01"
  end
  
  factory :reservation do
  end  
end