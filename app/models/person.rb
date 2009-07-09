# == Schema Information
# Schema version: 20080628075427
#
# Table name: people
#
#  id               :integer         not null, primary key
#  account_id       :integer
#  company_id       :integer
#  created_by_id    :integer
#  first_name       :string(20)
#  last_name        :string(20)
#  email            :string(80)
#  username         :string(30)
#  password         :string(55)
#  is_admin         :boolean
#  openid           :string(30)
#  title            :string(30)
#  office_number    :string(25)
#  office_extension :string(10)
#  mobile_number    :string(25)
#  fax_number       :string(25)
#  home_number      :string(25)
#  im_name          :string(80)
#  im_service       :string(30)
#  created_at       :datetime
#  updated_at       :datetime
#

class Person < ActiveRecord::Base
  
  belongs_to :account
  belongs_to :company
  belongs_to :message
  
  validates_presence_of :account_id, :company_id, :created_by_id
  validates_length_of :first_name, :within => 1..20
  validates_length_of :last_name, :within => 1..20
  validates_length_of :email, :within => 1..80
  validates_length_of :username, :within => 3..30
  validates_uniqueness_of :username, :scope => :account_id, :on => :create, :message => "is already in use. Please choose another"
  validates_length_of :password, :within => 4..55
  validates_length_of :openid, :maximum => 30,            :unless => Proc.new { |person| person.openid.blank? }
  validates_length_of :title, :maximum => 30,             :unless => Proc.new { |person| person.title.blank? }
  validates_length_of :office_number, :maximum => 25,     :unless => Proc.new { |person| person.office_number.blank? }
  validates_length_of :office_extension, :maximum => 10,  :unless => Proc.new { |person| person.office_extension.blank? }
  validates_length_of :mobile_number, :maximum => 25,     :unless => Proc.new { |person| person.mobile_number.blank? }
  validates_length_of :fax_number, :maximum => 25,        :unless => Proc.new { |person| person.fax_number.blank? }
  validates_length_of :home_number, :maximum => 25,       :unless => Proc.new { |person| person.home_number.blank? }
  validates_length_of :im_name, :maximum => 80,           :unless => Proc.new { |person| person.im_name.blank? }
  validates_length_of :im_service, :maximum => 30,        :unless => Proc.new { |person| person.im_service.blank? }
  validates_confirmation_of :password, :on => :create, :message => "should match confirmation", :if => Proc.new { |person| person.is_account_owner }
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def self.authenticate(username, password)
    person = self.find_by_username(username)
    if person
      if person.password == password
        return person
      else
        return nil
      end
    else
      return nil
    end
  end
  
end
