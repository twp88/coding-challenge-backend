class ChangeZombieWeaponsName < ActiveRecord::Migration[5.1]
  def change
    rename_table :zombie_weapons, :armory
  end
end
