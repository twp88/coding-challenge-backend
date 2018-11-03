class AddZombieArmorService
  def initialize(zombie_id, armor_name)
    @zombie_id = zombie_id
    @armor_name = armor_name
  end

  def call
    assign_variables

    return armors_repeat_error if repeat_armor_check?

    return max_armors_error if max_armors_check?

    create_armor
  end

  private

  def assign_variables
    @zombie = Zombie.find(@zombie_id)
    @armor = Armor.find_by(name: @armor_name)
  end

  def max_armors_check?
    return false if @zombie.armors.count < 4
    true
  end

  def repeat_armor_check?
    return false if Wardrobe.where(zombie_id: @zombie_id,
                                   armor_id: @armor.id).empty?
    true
  end

  def create_armor
    Wardrobe.create(zombie_id: @zombie.id, armor_id: @armor.id)
  end

  def armors_repeat_error
    "Zombie can't have the same armor twice!"
  end

  def max_armors_error
    'Zombie can only have a maximum four armor'
  end
end
