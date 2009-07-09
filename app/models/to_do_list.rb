# == Schema Information
# Schema version: 20080628075427
#
# Table name: to_do_lists
#
#  id            :integer         not null, primary key
#  account_id    :integer
#  project_id    :integer
#  created_by_id :integer
#  is_private    :boolean
#  description   :string(255)
#  milestone_id  :integer         default(0)
#  created_at    :datetime
#  updated_at    :datetime
#

class ToDoList < ActiveRecord::Base
  
  belongs_to :project
  has_many :to_do_items
  
  validates_presence_of :account_id, :project_id, :created_by_id
  validates_length_of :name, :within => 1..55
  validates_length_of :description, :maximum => 255
  
end
