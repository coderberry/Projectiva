# == Schema Information
# Schema version: 20080628075427
#
# Table name: milestones
#
#  id                     :integer         not null, primary key
#  account_id             :integer
#  project_id             :integer
#  created_by_id          :integer
#  name                   :string(255)
#  responsible_company_id :integer         default(0)
#  responsible_person_id  :integer         default(0)
#  email_before_due       :boolean         default(TRUE)
#  date_due               :date
#  is_complete            :boolean
#  created_at             :datetime
#  updated_at             :datetime
#

class Milestone < ActiveRecord::Base
  
  belongs_to :account
  belongs_to :project
  
  validates_presence_of :account_id, :project_id, :created_by_id
  validates_presence_of :date_due
  validates_length_of :name, :within => 1..255
  validates_uniqueness_of :name, :scope => :account_id
  
  def responsible_party_name
    if !responsible_person_id.nil? && responsible_person_id > 0
      Person.find(responsible_person_id).full_name
    elsif responsible_company_id > 0
      Company.find(responsible_company_id).name
    else
      "Personal"
    end
  end
    
end
