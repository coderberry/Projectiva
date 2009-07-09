# == Schema Information
# Schema version: 20080628075427
#
# Table name: project_people
#
#  id         :integer         not null, primary key
#  account_id :integer
#  project_id :integer
#  person_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class ProjectPerson < ActiveRecord::Base
  
  validates_presence_of :account_id, :project_id, :person_id
  
end
