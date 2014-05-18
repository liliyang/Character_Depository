class AddApprovedToClutches < ActiveRecord::Migration
  def up
    add_column :clutches, :approved, :boolean, default: false
  end
  
  def down
    remove_column :clutches, :approved
  end
end
