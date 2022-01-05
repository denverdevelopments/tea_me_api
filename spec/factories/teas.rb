FactoryBot.define do
  factory :tea do
    # type { Faker::Tea.variety }
    variety { Faker::Tea.variety }
    description { Faker::Lorem.sentence }
    temp { Faker::Number.between(from: 140, to: 212) }
    brew_time { Faker::Number.non_zero_digit }
  end
end
