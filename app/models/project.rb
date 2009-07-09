# == Schema Information
# Schema version: 20080628075427
#
# Table name: projects
#
#  id                                 :integer         not null, primary key
#  account_id                         :integer
#  name                               :string(255)
#  overview_page_announcement         :text
#  display_overview_page_announcement :boolean
#  start_controller                   :string(30)      default("overview")
#  primary_company_id                 :integer         default(0)
#  is_public                          :boolean
#  created_at                         :datetime
#  updated_at                         :datetime
#

class Project < ActiveRecord::Base
  
  belongs_to :account
  has_many :messages
  has_many :milestones, :order => :date_due, :conditions => { :is_complete => false }
  has_many :to_do_lists
  
  validates_presence_of :account_id, :primary_company_id
  validates_length_of :name, :within => 1..255, :message => "must be present"
  validates_uniqueness_of :name, :scope => :account_id
  
  def milestones_by_date(day)
    Milestone.find(:all, :order => :date_due, :conditions => ["date_due = ? and project_id = ? and is_complete = ?", day.strftime("%Y-%m-%d"), id, false]) || []
  end
  
  def all_milestones
    Milestone.find(:all, :conditions => { :project_id => id }, :order => :date_due)
  end
  
  def completed_milestones
    Milestone.find(:all, :order => :date_due, :conditions => { :project_id => id, :is_complete => true })
  end
  
  def to_do_items
    items = []
    to_do_lists.each do |list|
      list.to_do_items.each do |item|
        items << item
      end
    end
    items
  end
    
end
