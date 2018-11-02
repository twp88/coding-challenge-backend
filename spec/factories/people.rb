FactoryBot.define do
  factory :person do
    name Faker::Name.unique
    hp 4
  end
end
