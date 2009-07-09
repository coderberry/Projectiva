class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|                             
      t.string   :company,                                       :limit => 55  # required, min 3, max 55
      t.string   :timezone,                                      :limit => 55  # required, max 55
      t.string   :country,                                       :limit => 55  # required
      t.string   :sub_domain,                                    :limit => 30  # required, unique, min 3, max 30
      t.string   :domain,              :default => "taskb.us",   :limit => 30  # required

      t.string   :logo_file_name
      t.string   :logo_content_type
      t.integer  :logo_file_size
      t.datetime :logo_updated_at
                    
      t.string   :terms_of_service,    :default => "no",         :limit => 3   # required
      t.string   :site_name,                                     :limit => 55  # max 55 if not blank
      t.boolean  :email_notifications, :default => true
      t.boolean  :newsletter,          :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
