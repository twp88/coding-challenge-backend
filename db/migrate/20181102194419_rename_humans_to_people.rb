class RenameHumansToPeople < ActiveRecord::Migration[5.1]
  def change
    rename_table :humans, :people
  end
end
