class DeleteZombieArmorService
  def initialize(zombie_id, armor_name)
    @zombie_id = zombie_id
    @armor_name = armor_name
  end

  def call
    assign_values
    delete_wardrobe
  end

  private

  def assign_values
    @zombie = Zombie.find(@zombie_id)
    @armor = Armor.find_by(name: @armor_name)
    @armory = Wardrobe.where(zombie_id: @zombie.id, armor_id: @armor.id)
  end

  def delete_wardrobe
    Wardrobe.delete(@armory.first.id)
  end
end
