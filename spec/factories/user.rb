require "faker"

FactoryGirl.define do
  factory :user do
    name{Faker::Name.name}
    email{Faker::Internet.email}
    password "123qwe"
    password_confirmation "123qwe"
  end
  trait :admin do
    role{User.role[:admin]}
  end
end
