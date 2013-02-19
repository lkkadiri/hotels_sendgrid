FactoryGirl.define do
  factory :user do
    sequence(:email)                  { |n| "user_#{n}@example.com"}
    password               "password"
    password_confirmation  "password"
  end
end
Factory.define :admin, :class => User do |f|
  f.sequence(:email) {|n| "admin#{n}@hotelsendgrid.com"}
  f.password "admin123"
  f.password_confirmation "admin123"
  f.admin 1
end