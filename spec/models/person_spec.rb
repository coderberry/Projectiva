require File.dirname(__FILE__) + '/../spec_helper'

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

describe Person, " when first created" do
  
  fixtures :accounts, :companies, :people
  
  before(:each) do
    @person = Person.new(
      :account_id       => accounts(:one).id,
      :company_id       => companies(:one).id,
      :created_by_id    => people(:account_owner).id,
      :first_name       => "Aubree",
      :last_name        => "Berry",
      :email            => "aubree.berry@gmail.com",
      :username         => "aubree",
      :password         => "test",
      :is_admin         => true,
      :is_account_owner => false
    )
  end
  
  it "should be valid" do
    @person.valid?
    
    @person.should be_valid
  end
  
  after(:each) do
    @person = nil
  end

end