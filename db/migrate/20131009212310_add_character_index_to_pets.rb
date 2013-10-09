class AddCharacterIndexToPets < ActiveRecord::Migration
  def up
    add_column :pets, :character_id, :integer
    add_index :pets, :character_id
  end
  
  def down
    remove_column :pets, :character_id
  end
end
