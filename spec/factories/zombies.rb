FactoryBot.define do
  factory :zombie do
    name 'Kepler Laveran de Lima Ferreira'
    hit_points 10
    brains_eaten 5
    speed 7
    turn_date Time.now
  end

  factory :random_zombie do
    name { Fake::Buffy.unique.character }
    hit_points 10
    brains_eaten 5
    speed 7
    turn_date Time.now
  end
end
