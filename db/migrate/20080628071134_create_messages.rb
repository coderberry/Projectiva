class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :account_id                    # required
      t.integer :project_id                    # required
      t.integer :message_category_id           # required
      t.integer :person_id                     # required
      t.string  :title                         # required
      t.text    :body                          # required
      t.text    :extended_body
      t.boolean :is_private, :default => false # required
      t.integer :milestone_id, :default => 0   # required
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
