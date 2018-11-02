class ZombieFeedingService
  def call(food, zombie)
    zombie.hit_points += food.hp
    zombie.brains_eaten += 1
    zombie.hungry = false
    zombie.last_ate = Date.today
    food.destroy
  end
end
