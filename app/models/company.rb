# == Schema Information
# Schema version: 20080628075427
#
# Table name: companies
#
#  id               :integer         not null, primary key
#  account_id       :integer
#  created_by_id    :integer
#  name             :string(80)
#  address_1        :string(80)
#  address_2        :string(80)
#  city             :string(55)
#  state            :string(55)
#  zip              :string(15)
#  country          :string(2)
#  timezone         :string(15)      default("MST")
#  web_address      :string(150)
#  office_number    :string(25)
#  fax_number       :string(25)
#  can_view_private :boolean
#  logo_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Company < ActiveRecord::Base
  
  belongs_to :account
  has_many :people
  
  validates_presence_of :account_id, :created_by_id
  validates_length_of :name, :within => 1..80
  validates_length_of :address_1, :maximum => 80,     :unless => Proc.new { |company| company.address_1.blank? }
  validates_length_of :address_2, :maximum => 80,     :unless => Proc.new { |company| company.address_2.blank? }
  validates_length_of :city, :maximum => 55,          :unless => Proc.new { |company| company.city.blank? }
  validates_length_of :state, :maximum => 55,         :unless => Proc.new { |company| company.state.blank? }
  validates_length_of :zip, :maximum => 15,           :unless => Proc.new { |company| company.zip.blank? }
  validates_length_of :country, :maximum => 55,       :unless => Proc.new { |company| company.country.blank? }
  validates_length_of :web_address, :maximum => 150,  :unless => Proc.new { |company| company.web_address.blank? }
  validates_format_of :web_address, :with => /^https?:\/\/\S+$/, :unless => Proc.new { |company| company.web_address.blank? }
  validates_length_of :office_number, :maximum => 25, :unless => Proc.new { |company| company.office_number.blank? }
  validates_length_of :fax_number, :maximum => 25,    :unless => Proc.new { |company| company.fax_number.blank? }
  validates_uniqueness_of :name, :scope => :account_id
  
end
