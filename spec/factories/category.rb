FactoryGirl.define do
  factory :category do
    name{Faker::Commerce.product_name}
    description{Faker::Lorem.sentence}
    depth{Faker::Number.number(1)}
    left 1
    right 4
  end
end
