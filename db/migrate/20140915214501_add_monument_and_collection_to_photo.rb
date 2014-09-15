class AddMonumentAndCollectionToPhoto < ActiveRecord::Migration
  def up
    add_column :photos, :monument_id, :integer
    add_index :photos, :monument_id
    add_column :photos, :collection_id, :integer
    add_index :photos, :collection_id
    add_column :photos, :user_id, :integer
    add_index :photos, :user_id
  end

  def down
    remove_column :photos, :monument_id
    remove_column :photos, :collection_id
    remove_column :photos, :user_id
  end
end
