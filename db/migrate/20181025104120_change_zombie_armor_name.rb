class ChangeZombieArmorName < ActiveRecord::Migration[5.1]
  def change
    rename_table :zombie_armors, :wardrobes
  end
end
