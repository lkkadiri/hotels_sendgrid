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
end