# == Schema Information
# Schema version: 20080628075427
#
# Table name: message_subscribers
#
#  id         :integer         not null, primary key
#  account_id :integer
#  message_id :integer
#  person_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class MessageSubscriber < ActiveRecord::Base
  
  belongs_to :message
  
  validates_presence_of :account_id, :message_id, :person_id
  
  def person
    Person.find(self.person_id)
  end
  
end
