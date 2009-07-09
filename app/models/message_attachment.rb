# == Schema Information
# Schema version: 20080628075427
#
# Table name: message_attachments
#
#  id            :integer         not null, primary key
#  account_id    :integer
#  message_id    :integer
#  attachment_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class MessageAttachment < ActiveRecord::Base
  
  validates_presence_of :account_id, :message_id, :attachment_id
  
end
