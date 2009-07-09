class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.integer :account_id                             # required
      t.integer :project_id                             # required
      t.integer :created_by_id                          # required
      t.string  :name, :limit => 255                    # required
      t.integer :responsible_company_id, :default => 0  # required
      t.integer :responsible_person_id, :default => 0   # required
      t.boolean :email_before_due, :default => true     # required 
      t.date    :date_due                               # required
      t.boolean :is_complete, :default => false         # required
      t.timestamps
    end
  end

  def self.down
    drop_table :milestones
  end
end
