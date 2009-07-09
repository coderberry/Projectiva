class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :account_id                                             # required
      t.string  :name                                                   # required, max 80
      t.text    :overview_page_announcement         
      t.boolean :display_overview_page_announcement, :default => false 
      t.string  :start_controller, :limit => 30, :default => "overview" # required
      t.integer :primary_company_id, :default => 0                      # required
      t.boolean :is_public, :default => false                           # required 
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
