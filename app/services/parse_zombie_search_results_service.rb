class ParseZombieSearchResultsService
  def initialize(zombies)
    @zombies = zombies
  end

  def call
    combine_all_details
  end

  private

  def combine_all_details
    seperate_key_zombie_details.map do |zombie|
      "Zombie #{zombie.name}:
       Zombie id: #{zombie.id},
       Zombie hit_points: #{zombie.hit_points},
       Zombie brains_eaten: #{zombie.brains_eaten},
       Zombie speed: #{zombie.speed},
       Zombie turn_date: #{zombie.turn_date},
       Zombie hungry?: #{zombie.hungry?},
       Zombie last_ate: #{zombie.last_ate},
       Zombie weapons: #{associated_zombie_weapons(zombie)},
       Zombie armor: #{associated_zombie_armors(zombie)} ||"
    end
  end

  def seperate_key_zombie_details
    array = []
    @zombies.each { |z| array << z }
    array
  end

  def associated_zombie_weapons(zombie)
    weapons = Zombie.find(zombie.id).weapons
    weapons.map do |weapon|
      "Weapon name: #{weapon.name},
       Weapon attack_points: #{weapon.attack_points},
       Weapon durability: #{weapon.durability},
       Weapon price: #{weapon.price}"
    end
  end

  def associated_zombie_armors(zombie)
    armors = Zombie.find(zombie.id).armors
    armors.map do |armor|
      "Armor name: #{armor.name},
       Armor defense_points: #{armor.defense_points},
       Armor durability: #{armor.durability},
       Armor price: #{armor.price}"
    end
  end
end
