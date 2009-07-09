# == Schema Information
# Schema version: 20080628075427
#
# Table name: color_schemes
#
#  id            :integer         not null, primary key
#  account_id    :integer
#  created_by_id :integer
#  name          :string(30)
#  hex_value     :string(6)
#  created_at    :datetime
#  updated_at    :datetime
#

class ColorScheme < ActiveRecord::Base
  
  belongs_to :account
  
  validates_presence_of :account_id, :created_by_id
  validates_uniqueness_of :name, :scope => :account_id
  validates_length_of :name, :within => 3..30
  validates_length_of :hex_value, :is => 6, :message => "must be 6 characters long"
  validates_format_of :hex_value, :with => /([a-fA-F0-9][a-fA-F0-9])([a-fA-F0-9][a-fA-F0-9])([a-fA-F0-9][a-fA-F0-9])/
  
end
