# == Schema Information
# Schema version: 20080628075427
#
# Table name: default_message_categories
#
#  id         :integer         not null, primary key
#  name       :string(25)
#  created_at :datetime
#  updated_at :datetime
#

class DefaultMessageCategory < ActiveRecord::Base
  
  validates_length_of :name, :within => 1..25
  validates_uniqueness_of :name
  
  def self.copy_to(account_id)
    self.all.each do |item|
      MessageCategory.create(
        :account_id => account_id,
        :created_by_id => 0,
        :name => item.name
      )
    end
  end
  
end
