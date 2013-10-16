class AddUserIdToCharacters < ActiveRecord::Migration
  def up
    add_column :characters, :user_id, :integer
    add_index :characters, :user_id
  end
  
  def down
    remove_column :characters, :user_id
  end
end
