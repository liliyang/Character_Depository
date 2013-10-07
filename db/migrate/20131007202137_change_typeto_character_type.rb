class ChangeTypetoCharacterType < ActiveRecord::Migration
  def change
    rename_column :characters, :type, :character_type
  end
end
