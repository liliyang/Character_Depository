class AddPostIdToEggs < ActiveRecord::Migration
  def up
    add_column :eggs, :post_id, :integer
    add_column :eggs, :creature_name, :string
    add_index :eggs, :post_id
  end
  
  def down
    remove_column :eggs, :creature_name, :string
    remove_index :eggs, :post_id
    remove_column :eggs, :post_id, :integer
  end
end
