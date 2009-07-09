# == Schema Information
# Schema version: 20080628075427
#
# Table name: to_do_items
#
#  id                     :integer         not null, primary key
#  account_id             :integer
#  to_do_list_id          :integer
#  created_by_id          :integer
#  description            :string(255)
#  is_complete            :boolean
#  date_time_completed    :datetime
#  responsible_company_id :integer         default(0)
#  responsible_person_id  :integer         default(0)
#  position               :integer         default(0)
#  created_at             :datetime
#  updated_at             :datetime
#

class ToDoItem < ActiveRecord::Base
  
  belongs_to :to_do_list
  
  validates_presence_of :account_id, :to_do_list_id, :created_by_id
  validates_presence_of :responsible_company_id, :responsible_person_id, :position
  validates_length_of :description, :within => 1..255
  validates_presence_of :date_time_completed, :if => :complete?
  
  def complete?
    self.is_complete
  end
  
  def responsible_party_name
    if !responsible_person_id.nil?
      Person.find(responsible_person_id).full_name
    elsif responsible_company_id > 0
      Company.find(responsible_company_id).name
    else
      "Personal"
    end
  end
  
end
