class ChangeStringToText < ActiveRecord::Migration
  def up
    change_column :articles, :body, :text
    add_column :users, :age, :integer
    add_column :users, :messenger, :string
    add_column :characters, :preference, :string
    add_column :characters, :abilities, :text
    add_column :dragons, :wing, :string
    add_column :dragons, :size, :string
    add_column :dragons, :abilities, :text
    add_column :characters, :dragon_preference, :string
    add_column :characters, :dragon_names, :string
    add_column :characters, :craft_rank, :string
    add_column :characters, :craft_specialty, :string
    add_column :characters, :craft_abilities, :text
    add_column :characters, :hold, :string
    add_column :characters, :hold_size, :string
    remove_column :characters, :birthdate
    remove_column :characters, :rider
    remove_column :characters, :candidate
    remove_column :characters, :crafter
    remove_column :characters, :holder
  end
  
  def down
    change_column :articles, :body, :string
    remove_column :users, :age
    remove_column :users, :messenger
    remove_column :characters, :preference
    remove_column :characters, :abilities
    remove_column :dragons, :wing
    remove_column :dragons, :size
    remove_column :dragons, :abilities
    remove_column :characters, :dragon_preference
    remove_column :characters, :dragon_names
    remove_column :characters, :craft_rank
    remove_column :characters, :craft_specialty
    remove_column :characters, :craft_abilities
    remove_column :characters, :hold
    remove_column :characters, :hold_size
    add_column :characters, :birthdate, :date
    add_column :characters, :rider, :boolean
    add_column :characters, :candidate, :boolean
    add_column :characters, :crafter, :boolean
    add_column :characters, :holder, :boolean
  end
end
