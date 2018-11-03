class DeleteZombieWeaponService
  def initialize(zombie_id, weapon_name)
    @zombie_id = zombie_id
    @weapon_name = weapon_name
  end

  def call
    assign_values
    delete_armory
  end

  private

  def assign_values
    @zombie = Zombie.find(@zombie_id)
    @weapon = Weapon.find_by(name: @weapon_name)
    @armory = Armory.where(zombie_id: @zombie.id, weapon_id: @weapon.id)
  end

  def delete_armory
    Armory.delete(@armory.first.id)
  end
end
