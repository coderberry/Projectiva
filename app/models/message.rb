# == Schema Information
# Schema version: 20080628075427
#
# Table name: messages
#
#  id                  :integer         not null, primary key
#  account_id          :integer
#  project_id          :integer
#  message_category_id :integer
#  person_id           :integer
#  body                :text
#  extended_body       :text
#  is_private          :boolean
#  milestone_id        :integer         default(0)
#  created_at          :datetime
#  updated_at          :datetime
#

class Message < ActiveRecord::Base
  
  belongs_to :project
  has_one :person
  has_many :message_subscribers, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  validates_presence_of :account_id, :project_id, :person_id
  validates_presence_of :title, :body
  
  def is_subscribed?(person)
    MessageSubscriber.find(:first, :conditions => ["person_id = ? and message_id = ?", person.id, id]).nil? ? false : true
  end
  
end
