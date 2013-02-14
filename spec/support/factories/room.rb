FactoryGirl.define do
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
end