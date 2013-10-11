class AddCraftToCharacter < ActiveRecord::Migration
  def up
    add_column :characters, :craft, :string
    change_column :characters, :name, :string, unique: true
  end
  
  def down
    remove_column :characters, :craft
    change_column :characters, :name, :string, unique: false
  end
end
