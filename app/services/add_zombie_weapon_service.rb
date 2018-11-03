class AddZombieWeaponService
  def initialize(zombie_id, weapon_name)
    @zombie_id = zombie_id
    @weapon_name = weapon_name
  end

  def call
    @zombie = Zombie.find(@zombie_id)
    @weapon = Weapon.find_by(name: @weapon_name)
    Armory.create(zombie_id: @zombie.id, weapon_id: @weapon.id)
  end
end
