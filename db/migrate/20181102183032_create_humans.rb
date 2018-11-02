class CreateHumans < ActiveRecord::Migration[5.1]
  def change
    create_table :humans do |t|
      t.string :name
      t.integer :hp
    end
  end
end
