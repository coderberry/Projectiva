class CreateSimpleAttachments < ActiveRecord::Migration
  def self.up
    create_table :simple_attachments do |t|
      t.string   :attachment_file_name
      t.string   :attachment_content_type
      t.integer  :attachment_file_size
      t.datetime :attachment_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :simple_attachments
  end
end
