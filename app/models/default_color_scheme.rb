# == Schema Information
# Schema version: 20080628075427
#
# Table name: default_color_schemes
#
#  id                :integer         not null, primary key
#  name              :string(30)
#  default_hex_value :string(6)
#  path_to_thumbnail :string(55)
#  created_at        :datetime
#  updated_at        :datetime
#

class DefaultColorScheme < ActiveRecord::Base
  
  validates_length_of :name, :within => 3..30
  validates_uniqueness_of :name
  validates_length_of :default_hex_value, :is => 6, :message => "must be 6 characters long"
  validates_format_of :default_hex_value, :with => /([a-fA-F0-9][a-fA-F0-9])([a-fA-F0-9][a-fA-F0-9])([a-fA-F0-9][a-fA-F0-9])/
  
  def self.copy_to(account_id)
    self.all.each do |item|
      cs = ColorScheme.create(
        :account_id => account_id,
        :created_by_id => 0,
        :name => item.name,
        :hex_value => item.default_hex_value
      )
    end
  end
  
end
