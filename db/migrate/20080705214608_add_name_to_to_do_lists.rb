class AddNameToToDoLists < ActiveRecord::Migration
  def self.up
    add_column :to_do_lists, :name, :string, :limit => 55
  end

  def self.down
    remove_column :to_do_lists, :name
  end
end
