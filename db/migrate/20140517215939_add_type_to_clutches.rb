class AddTypeToClutches < ActiveRecord::Migration
  def up
    add_column :clutches, :creature_type, :string
  end
  
  def down
    remove_column :clutches, :creature_type
  end
end
