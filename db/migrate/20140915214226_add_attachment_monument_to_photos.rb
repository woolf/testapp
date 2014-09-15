class AddAttachmentMonumentToPhotos < ActiveRecord::Migration
  def self.up
    create_table :photos
    change_table :photos do |t|
      t.attachment :monument
    end
  end

  def self.down
    drop_table :photos
  end
end
