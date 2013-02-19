FactoryGirl.define do
  factory :user do
    sequence(:email)                  { |n| "user_#{n}@example.com"}
    password               "password"
    password_confirmation  "password"
    factory :admin do
      self.admin 1
    end
  end
end