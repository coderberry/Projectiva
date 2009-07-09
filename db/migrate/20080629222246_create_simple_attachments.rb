class CreateSimpleAttachments < ActiveRecord::Migration
  def self.up
    create_table :simple_attachments do |t|
      t.string  :content_type
      t.string  :filename
      t.string  :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height
      t.timestamps
    end
  end

  def self.down
    drop_table :simple_attachments
  end
end
