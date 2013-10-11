class ChangePetsName < ActiveRecord::Migration
  def up
    rename_column :characters, :pets, :pet_count
  end
  
  def down
    rename_column :characters, :pet_count, :pets
  end
end
