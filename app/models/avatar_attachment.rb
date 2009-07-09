# == Schema Information
# Schema version: 20080628075427
#
# Table name: avatar_attachments
#
#  id            :integer         not null, primary key
#  account_id    :integer
#  person_id     :integer
#  created_by_id :integer
#  attachment_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class AvatarAttachment < ActiveRecord::Base
  
  validates_presence_of :account_id, :person_id, :created_by_id, :attachment_id
  
end
