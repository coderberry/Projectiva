class CreateAvatarAttachments < ActiveRecord::Migration
  def self.up
    create_table :avatar_attachments do |t|
      t.integer :account_id    # required
      t.integer :person_id     # required
      t.integer :created_by_id # required
      t.integer :attachment_id # required
      t.timestamps
    end
  end

  def self.down
    drop_table :avatar_attachments
  end
end
