class ChangeActiveDefaultValue < ActiveRecord::Migration
  def change
    change_column :characters, :active, :boolean, default: true
  end
end
