class AddHungerAttributeToZombies < ActiveRecord::Migration[5.1]
  def change
    add_column :zombies, :hungry, :boolean, default: false
  end
end
