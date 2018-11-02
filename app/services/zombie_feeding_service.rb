class ZombieFeedingService
  def call(food, zombie)
    change_zombie(food, zombie)
    destroy_food(food)
  end

  private

  def change_zombie(food, zombie)
    zombie.hit_points += food.hp
    zombie.brains_eaten += 1
    zombie.hungry = false
    zombie.last_ate = Date.today
  end

  def destroy_food(food)
    food.destroy
  end
end
