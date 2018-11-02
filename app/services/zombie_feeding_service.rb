class ZombieFeedingService
  def call(food, zombie)
    food.destroy
  end
end
