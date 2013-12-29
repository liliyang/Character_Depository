class AddUsernameToArticles < ActiveRecord::Migration
  def up
    add_column :articles, :username, :string
  end
  
  def down
    remove_column :articles, :username
  end
end
