class CreateMessageSubscribers < ActiveRecord::Migration
  def self.up
    create_table :message_subscribers do |t|
      t.integer :account_id # required
      t.integer :message_id # required
      t.integer :person_id  # required
      t.timestamps
    end
  end

  def self.down
    drop_table :message_subscribers
  end
end
