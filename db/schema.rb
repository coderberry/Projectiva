# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080705214608) do

  create_table "accounts", :force => true do |t|
    t.string   "company",             :limit => 55
    t.string   "timezone",            :limit => 55
    t.string   "country",             :limit => 55
    t.string   "sub_domain",          :limit => 30
    t.string   "domain",              :limit => 30, :default => "taskb.us"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "terms_of_service",    :limit => 3,  :default => "no"
    t.string   "site_name",           :limit => 55
    t.boolean  "email_notifications",               :default => true
    t.boolean  "newsletter",                        :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avatar_attachments", :force => true do |t|
    t.integer  "account_id"
    t.integer  "person_id"
    t.integer  "created_by_id"
    t.integer  "attachment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "color_schemes", :force => true do |t|
    t.integer  "account_id"
    t.integer  "created_by_id"
    t.string   "name",          :limit => 30
    t.string   "hex_value",     :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "account_id"
    t.integer  "message_id"
    t.integer  "person_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.integer  "account_id"
    t.integer  "created_by_id"
    t.string   "name",             :limit => 80
    t.string   "address_1",        :limit => 80
    t.string   "address_2",        :limit => 80
    t.string   "city",             :limit => 55
    t.string   "state",            :limit => 55
    t.string   "zip",              :limit => 15
    t.string   "country",          :limit => 55
    t.string   "timezone",         :limit => 55
    t.string   "web_address",      :limit => 150
    t.string   "office_number",    :limit => 25
    t.string   "fax_number",       :limit => 25
    t.boolean  "can_view_private",                :default => false
    t.integer  "logo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_color_schemes", :force => true do |t|
    t.string   "name",              :limit => 30
    t.string   "default_hex_value", :limit => 6
    t.boolean  "locked",                          :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_file_categories", :force => true do |t|
    t.string   "name",       :limit => 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "default_message_categories", :force => true do |t|
    t.string   "name",       :limit => 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_categories", :force => true do |t|
    t.integer  "account_id"
    t.integer  "created_by_id"
    t.string   "name",          :limit => 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_attachments", :force => true do |t|
    t.integer  "account_id"
    t.integer  "message_id"
    t.integer  "attachment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_categories", :force => true do |t|
    t.integer  "account_id"
    t.integer  "created_by_id"
    t.string   "name",          :limit => 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_subscribers", :force => true do |t|
    t.integer  "account_id"
    t.integer  "message_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "account_id"
    t.integer  "project_id"
    t.integer  "message_category_id"
    t.integer  "person_id"
    t.string   "title"
    t.text     "body"
    t.text     "extended_body"
    t.boolean  "is_private",          :default => false
    t.integer  "milestone_id",        :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", :force => true do |t|
    t.integer  "account_id"
    t.integer  "project_id"
    t.integer  "created_by_id"
    t.string   "name"
    t.integer  "responsible_company_id", :default => 0
    t.integer  "responsible_person_id",  :default => 0
    t.boolean  "email_before_due",       :default => true
    t.date     "date_due"
    t.boolean  "is_complete",            :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.integer  "account_id"
    t.integer  "company_id"
    t.integer  "created_by_id"
    t.string   "first_name",       :limit => 20
    t.string   "last_name",        :limit => 20
    t.string   "email",            :limit => 80
    t.string   "username",         :limit => 30
    t.string   "password",         :limit => 55
    t.boolean  "is_admin",                       :default => false
    t.string   "openid",           :limit => 30
    t.string   "title",            :limit => 30
    t.string   "office_number",    :limit => 25
    t.string   "office_extension", :limit => 10
    t.string   "mobile_number",    :limit => 25
    t.string   "fax_number",       :limit => 25
    t.string   "home_number",      :limit => 25
    t.string   "im_name",          :limit => 80
    t.string   "im_service",       :limit => 30
    t.boolean  "is_account_owner",               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_people", :force => true do |t|
    t.integer  "account_id"
    t.integer  "project_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.integer  "account_id"
    t.string   "name"
    t.text     "overview_page_announcement"
    t.boolean  "display_overview_page_announcement",               :default => false
    t.string   "start_controller",                   :limit => 30, :default => "overview"
    t.integer  "primary_company_id",                               :default => 0
    t.boolean  "is_public",                                        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_attachments", :force => true do |t|
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "to_do_items", :force => true do |t|
    t.integer  "account_id"
    t.integer  "to_do_list_id"
    t.integer  "created_by_id"
    t.string   "description"
    t.boolean  "is_complete",            :default => false
    t.datetime "date_time_completed"
    t.integer  "responsible_company_id", :default => 0
    t.integer  "responsible_person_id",  :default => 0
    t.integer  "position",               :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "to_do_lists", :force => true do |t|
    t.integer  "account_id"
    t.integer  "project_id"
    t.integer  "created_by_id"
    t.boolean  "is_private",                  :default => false
    t.string   "description"
    t.integer  "milestone_id",                :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",          :limit => 55
  end

end
