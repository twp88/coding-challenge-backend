class ZombieFeedingService
  def call(food, zombie)
    zombie.hit_points += food.hp
    zombie.brains_eaten += 1
    zombie.hungry = false
    food.destroy
  end
end
