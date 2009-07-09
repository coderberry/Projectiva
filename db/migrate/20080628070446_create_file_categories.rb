class CreateFileCategories < ActiveRecord::Migration
  def self.up
    create_table :file_categories do |t|
      t.integer :account_id        # required
      t.integer :created_by_id     # required
      t.string :name, :limit => 25 # required, max 25
      t.timestamps
    end
  end

  def self.down
    drop_table :file_categories
  end
end
