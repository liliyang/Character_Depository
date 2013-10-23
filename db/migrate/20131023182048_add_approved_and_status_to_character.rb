class AddApprovedAndStatusToCharacter < ActiveRecord::Migration
  def up
    add_column :characters, :approved, :boolean, default: false
    add_column :characters, :active, :boolean, default: false
  end
  
  def down
    remove_column :characters, :approved
    remove_column :characters, :active
  end
end
