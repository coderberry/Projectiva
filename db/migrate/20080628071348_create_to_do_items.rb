class CreateToDoItems < ActiveRecord::Migration
  def self.up
    create_table :to_do_items do |t|
      t.integer  :account_id                            # required
      t.integer  :to_do_list_id                         # required
      t.integer  :created_by_id                         # required
      t.string   :description, :limit => 255            # required, max 255
      t.boolean  :is_complete, :default => false        # required
      t.datetime :date_time_completed                   # required if is_complete == true
      t.integer  :responsible_company_id, :default => 0 # required
      t.integer  :responsible_person_id, :default => 0  # required
      t.integer  :position, :default => 0               # required
      t.timestamps                       
    end
  end

  def self.down
    drop_table :to_do_items
  end
end
