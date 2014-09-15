class AddCollectionToMonumets < ActiveRecord::Migration
  def up
    add_column :monuments, :collection_id, :integer
    add_index :monuments, :collection_id
  end

  def down
    remove_index :monuments, :collection_id
    remove_column :monuments, :collection_id
  end
end
