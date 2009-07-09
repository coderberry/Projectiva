class CreateDefaultColorSchemes < ActiveRecord::Migration
  def self.up
    create_table :default_color_schemes do |t|
      t.string :name, :limit => 30              # required, min 3, max 30
      t.string :default_hex_value, :limit => 6  # required, min 6, max 6
      t.boolean :locked, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :default_color_schemes
  end
end
