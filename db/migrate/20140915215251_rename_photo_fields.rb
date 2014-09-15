class RenamePhotoFields < ActiveRecord::Migration
  def change
    rename_column :photos, :monument_file_name, :image_file_name
    rename_column :photos, :monument_content_type, :image_content_type
    rename_column :photos, :monument_file_size, :image_file_size
    rename_column :photos, :monument_updated_at, :image_updated_at
  end
end
