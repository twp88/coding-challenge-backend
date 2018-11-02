class AddLastAteToZombie < ActiveRecord::Migration[5.1]
  def change
    add_column :zombies, :last_ate, :date
  end
end
