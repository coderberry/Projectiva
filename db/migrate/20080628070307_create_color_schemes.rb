class CreateColorSchemes < ActiveRecord::Migration
  def self.up
    create_table :color_schemes do |t|
      t.integer :account_id               # required
      t.integer :created_by_id            # required
      t.string  :name, :limit => 30       # required, min 3, max 30
      t.string  :hex_value, :limit => 6   # required, min 6, max 6
      t.timestamps
    end
  end

  def self.down
    drop_table :color_schemes
  end
end
