class ChangeArmoryName < ActiveRecord::Migration[5.1]
  def change
    rename_table :armory, :armories
  end
end
