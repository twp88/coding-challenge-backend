FactoryBot.define do
  factory :zombie do
    name 'Kepler Laveran de Lima Ferreira'
    hit_points 10
    brains_eaten 5
    speed 7
    turn_date Time.now
    id 1
  end

  trait :random_zombie do
    name { Fake::Buffy.unique.character }
    hit_points 10
    brains_eaten 5
    speed 7
    turn_date Time.now
    id 2
  end
end
