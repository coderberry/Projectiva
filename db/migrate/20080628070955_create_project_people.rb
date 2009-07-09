class CreateProjectPeople < ActiveRecord::Migration
  def self.up
    create_table :project_people do |t|
      t.integer :account_id  # required
      t.integer :project_id  # required
      t.integer :person_id   # required
      t.timestamps
    end
  end

  def self.down
    drop_table :project_people
  end
end
