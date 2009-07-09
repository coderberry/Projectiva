class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.integer :account_id                                 # required
      t.integer :created_by_id                              # required
      t.string  :name, :limit => 80                         # required, max 80
      t.string  :address_1, :limit => 80                    # max 80
      t.string  :address_2, :limit => 80                    # max 80
      t.string  :city, :limit => 55                         # max 55
      t.string  :state, :limit => 55                        # max 55
      t.string  :zip, :limit => 15                          # max 15
      t.string  :country, :limit => 55                      # max 55
      t.string  :timezone, :limit => 55                     # required, max 55
      t.string  :web_address, :limit => 150                 # max 150
      t.string  :office_number, :limit => 25                # max 25
      t.string  :fax_number, :limit => 25                   # max 25
      t.boolean :can_view_private, :default => false        # required
      t.integer :logo_id
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
