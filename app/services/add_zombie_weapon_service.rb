class AddZombieWeaponService
  def initialize(zombie_id, weapon_name)
    @zombie_id = zombie_id
    @weapon_name = weapon_name
  end

  def call
    assign_variables

    return weapons_repeat_error if repeat_weapon_check?

    return max_weapons_error if max_weapons_check?

    create_weapon
  end

  private

  def assign_variables
    @zombie = Zombie.find(@zombie_id)
    @weapon = Weapon.find_by(name: @weapon_name)
  end

  def max_weapons_check?
    return false if @zombie.weapons.count < 4
    true
  end

  def repeat_weapon_check?
    return false if Armory.where(zombie_id: @zombie_id,
                                 weapon_id: @weapon.id).empty?
    true
  end

  def create_weapon
    Armory.create(zombie_id: @zombie.id, weapon_id: @weapon.id)
  end

  def weapons_repeat_error
    "Zombie can't have the same weapon twice!"
  end

  def max_weapons_error
    'Zombie can only have a maximum four weapons'
  end
end
