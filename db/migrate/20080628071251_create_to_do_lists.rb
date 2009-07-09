class CreateToDoLists < ActiveRecord::Migration
  def self.up
    create_table :to_do_lists do |t|
      t.integer :account_id                    # required
      t.integer :project_id                    # required
      t.integer :created_by_id                 # required
      t.boolean :is_private, :default => false # required
      t.string  :description, :limit => 255    # required, max 255
      t.integer :milestone_id, :default => 0   # required
      t.timestamps
    end
  end

  def self.down
    drop_table :to_do_lists
  end
end
