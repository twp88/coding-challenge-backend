class AddZombieWeaponService
  def initialize(zombie_id, weapon_name)
    @zombie_id = zombie_id
    @weapon_name = weapon_name
  end

  def call
    assign_variables

    repeat_weapon_check? ? error_message : create_weapon
  end

  private

  def assign_variables
    @zombie = Zombie.find(@zombie_id)
    @weapon = Weapon.find_by(name: @weapon_name)
  end

  def repeat_weapon_check?
    return false if Armory.where(zombie_id: @zombie_id,
                                 weapon_id: @weapon.id).empty?
    true
  end

  def create_weapon
    Armory.create(zombie_id: @zombie.id, weapon_id: @weapon.id)
  end

  def error_message
    "Zombie can't have the same weapon twice!"
  end
end
