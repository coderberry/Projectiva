require File.dirname(__FILE__) + '/../spec_helper'

describe Company, " when first created" do
  
  fixtures :accounts, :companies, :people
  
  before(:each) do
    @company = Company.new(
      :account_id => accounts(:one).id,
      :created_by_id => people(:account_owner).id,
      :name => "XYZ Savings",
      :timezone => "MST",
      :can_view_private => true
    )
  end
  
  it "should be valid" do
    @company.should be_valid
  end
  
  it "should not be valid if name is missing" do
    @company.name = nil
    @company.should_not be_valid
  end
  
  it "should not be valid if name is too long" do
    @company.name = "123456789012345678901234567890123456789012345678901234567890123456789012345678901" # 81 chars
    @company.should_not be_valid
  end
  
  it "should not be valid if address_1 is too long" do
    @company.address_1 = "123456789012345678901234567890123456789012345678901234567890123456789012345678901" # 81 chars
    @company.should_not be_valid  
  end
  
  it "should not be valid if address_2 is too long" do
    @company.address_2 = "123456789012345678901234567890123456789012345678901234567890123456789012345678901" # 81 chars
    @company.should_not be_valid
  end
  
  it "should not be valid if city is too long" do
    @company.city = "12345678901234567890123456789012345678901234567890123456" # 56 chars
    @company.should_not be_valid
  end
  
  it "should not be valid if state is too long" do
    @company.state = "12345678901234567890123456789012345678901234567890123456" # 56 chars
    @company.should_not be_valid
  end
  
  it "should not be valid if zip is too long" do
    @company.zip = "1234567890123456" # 16 chars
    @company.should_not be_valid
  end
  
  it "should not be valid if country is too long" do
    @company.country = "ABC"
    @company.should_not be_valid
  end
  
  it "should not be valid if timezone is too short" do
    @company.timezone = nil
    @company.should_not be_valid
  end
  
  it "should not be valid if timezone is too long" do
    @company.timezone = "1234567890123456" # 16 chars
    @company.should_not be_valid
  end
  
  it "should not be valid if web_address is too long" do
    @company.web_address = "12345678901234567890123456789012345678901234567890" +
                           "12345678901234567890123456789012345678901234567890" +
                           "123456789012345678901234567890123456789012345678901" # 151 chars
    @company.should_not be_valid
  end
  
  it "should not be valid if web_address does not start with 'http://' or 'https://'" do
    @company.web_address = "www.google.com"
    @company.should_not be_valid
  end
  
  it "should be valid with a web address starting with 'http://'" do
    @company.web_address = "http://www.google.com"
    @company.should be_valid
  end
  
  it "should be valid with a web address starting with 'https://'" do
    @company.web_address = "https://www.google.com"
    @company.should be_valid
  end
  
  it "should not be valid if office_number is too long" do
    @company.office_number = "12345678901234567890123456"
    @company.should_not be_valid
  end
  
  it "should not be valid if fax_number is too long" do
    @company.fax_number = "12345678901234567890123456"
    @company.should_not be_valid
  end
  
  it "should not be valid if name is already in use by this account" do
    @company.name = companies(:one).name
    @company.account_id = companies(:one).account_id
    @company.should_not be_valid
  end
  
  after(:each) do
    @company = nil
  end
  
end