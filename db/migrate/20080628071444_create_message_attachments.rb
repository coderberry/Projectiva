class CreateMessageAttachments < ActiveRecord::Migration
  def self.up
    create_table :message_attachments do |t|
      t.integer :account_id    # required
      t.integer :message_id    # required
      t.integer :attachment_id # required
      t.timestamps
    end
  end

  def self.down
    drop_table :message_attachments
  end
end
