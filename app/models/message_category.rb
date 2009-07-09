# == Schema Information
# Schema version: 20080628075427
#
# Table name: message_categories
#
#  id            :integer         not null, primary key
#  account_id    :integer
#  created_by_id :integer
#  name          :string(25)
#  created_at    :datetime
#  updated_at    :datetime
#

class MessageCategory < ActiveRecord::Base
  
  belongs_to :account
  
  validates_presence_of :account_id, :created_by_id
  validates_length_of :name, :within => 1..25
  validates_uniqueness_of :name, :scope => :account_id
  
end
