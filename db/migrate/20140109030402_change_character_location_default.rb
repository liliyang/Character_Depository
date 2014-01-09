class ChangeCharacterLocationDefault < ActiveRecord::Migration
  def change
    change_column :characters, :location, :string, default: nil
  end
end
