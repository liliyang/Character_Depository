class AddCategoryToCharacter < ActiveRecord::Migration
  def up
    add_column :characters, :category, :string
  end
  
  def down
    remove_column :characters, :category, :string
  end
end
