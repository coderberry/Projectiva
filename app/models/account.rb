# == Schema Information
# Schema version: 20080628075427
#
# Table name: accounts
#
#  id                  :integer         not null, primary key
#  company             :string(55)
#  timezone            :string(15)      default("MST")
#  sub_domain          :string(30)
#  domain              :string(30)      default("taskb.us")
#  logo_id             :integer
#  site_name           :string(55)
#  email_notifications :boolean         default(TRUE)
#  newsletter          :boolean         default(TRUE)
#  created_at          :datetime
#  updated_at          :datetime
#

class Account < ActiveRecord::Base
  
  has_attached_file :logo, :styles => { :medium => "250x150>" }
  
  has_many :color_schemes
  has_many :message_categories
  has_many :file_categories
  has_many :companies
  has_many :people
  has_many :projects
  has_many :milestones
  
  validates_presence_of :email_notifications, :newsletter, :terms_of_service, :country
  validates_length_of :company, :within => 3..55
  validates_length_of :sub_domain, :within => 3..30
  validates_length_of :domain, :within => 3..30
  validates_acceptance_of :terms_of_service, :accept => "yes"
  validates_length_of :site_name, :within => 3..55
  validates_uniqueness_of :sub_domain
  
  before_validation_on_create :update_defaults
  
  def personal_people
    Person.find(:all, :conditions => ["account_id = ? and company_id = ?", id, 0])
  end
  
  private
  
  def update_defaults
    if self.site_name.blank?
      self.site_name = "#{self.company}'s Task Bus"
    end
  end
  
end
