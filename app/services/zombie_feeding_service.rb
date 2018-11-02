class ZombieFeedingService
  def call(food, zombie)
    zombie.hit_points += food.hp
    food.destroy
  end
end
