class AddColorToClutches < ActiveRecord::Migration
  def up
    add_column :clutches, :dame_color, :string
    add_column :clutches, :sire_color, :string
  end
  
  def down
    remove_column :clutches, :dame_color
    remove_column :clutches, :sire_color
  end
end
