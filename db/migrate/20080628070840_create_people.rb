class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.integer :account_id                     # required
      t.integer :company_id                     # required
      t.integer :created_by_id                  # required
      t.string  :first_name, :limit => 20       # required, max 20
      t.string  :last_name, :limit => 20        # required, max 20
      t.string  :email, :limit => 80            # required, max 80, unique
      t.string  :username, :limit => 30         # required, max 30, unique
      t.string  :password, :limit => 55         # required, min 4, max 55
      t.boolean :is_admin, :default => false    # required
      t.string  :openid, :limit => 30           # max 30
      t.string  :title, :limit => 30            # max 30
      t.string  :office_number, :limit => 25    # max 25
      t.string  :office_extension, :limit => 10 # max 10
      t.string  :mobile_number, :limit => 25    # max 25
      t.string  :fax_number, :limit => 25       # max 25
      t.string  :home_number, :limit => 25      # max 25
      t.string  :im_name , :limit => 80         # max 80
      t.string  :im_service, :limit => 30       # max 30
      t.boolean :is_account_owner, :default => false # required
      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
