class AddPictureToCharacter < ActiveRecord::Migration
  def up
    add_column :characters, :picture, :string, unique: true
  end
  
  def down
    remove_column :characters, :picture
  end
end
