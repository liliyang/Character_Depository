class ChangeColumnsToAddDefault < ActiveRecord::Migration
  def up
    change_column :characters, :location, :string, default: "Arolos Weyr"
    change_column :characters, :pets, :integer, default: 0
    change_column :characters, :rider, :boolean, default: false
    change_column :characters, :candidate, :boolean, default: false
    change_column :characters, :crafter, :boolean, default: false
    change_column :characters, :holder, :boolean, default: false
  end

  def down
    change_column :characters, :location, :string, default: nil
    change_column :characters, :pets, :integer, default: nil
    change_column :characters, :rider, :boolean, default: nil
    change_column :characters, :candidate, :boolean, default: nil
    change_column :characters, :crafter, :boolean, default: nil
    change_column :characters, :holder, :boolean, default: nil
  end
end
