FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.word }
    price { 1.5 }
    status { Faker::Number.between(from: 1, to: 3) }
    frequency { Faker::Number.between(from: 1, to: 4) }
    tea { Faker::Number.between(from: 1, to: 5) }
    customer { Faker::Number.between(from: 1, to: 3) }
  end
end
