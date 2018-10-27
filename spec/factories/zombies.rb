FactoryBot.define do
  factory :zombie do
    name 'Kepler Laveran de Lima Ferreira'
    hit_points 10
    brains_eaten 5
    speed 7
    turn_date Time.now
    id { Faker::Number.unique }
  end
end
