require File.dirname(__FILE__) + '/../spec_helper'

describe Account, " when first created" do
  
  fixtures :accounts
  
  before(:each) do
    @account =Account.new(
      :company => "Test Company",
      :sub_domain => "test",
      :terms_of_service => "yes"
    )
  end

  it "should be valid" do
    @account.should be_valid
  end
  
  it "should not be valid if timezone is missing" do
    @account.timezone = nil
    @account.should_not be_valid
  end
  
  it "should not be valid if company is too short" do
    @account.company = "hi"
    @account.should_not be_valid
  end
  
  it "should not be valid if company is too long" do
    @account.company = "12345678901234567890123456789012345678901234567890123456" # 56 chars
    @account.should_not be_valid
  end
  
  it "should not be valid if sub_domain is too short" do
    @account.sub_domain = "hi"
    @account.should_not be_valid
  end
  
  it "should not be valid if sub_domain is too long" do
    @account.sub_domain = "1234567890123456789012345678901" # 31 chars
    @account.should_not be_valid
  end
  
  it "should not be valid if an existing sub_domain already exists" do
    @account.sub_domain = "already_existing"
    @account.should_not be_valid
  end
  
  it "should not be valid if domain is too short" do
    @account.domain = "hi"
    @account.should_not be_valid
  end
  
  it "should not be valid if domain is too long" do
    @account.domain = "1234567890123456789012345678901" # 31 chars
    @account.should_not be_valid
  end
  
  it "should not be valid if terms of service are not agreed to" do
    @account.terms_of_service = "no"
    @account.should_not be_valid
  end
  
  it "should not be valid if terms of service is nil" do
    @account.terms_of_service = nil
    @account.should_not be_valid
  end
  
  it "should not be valid if site name is too short" do
    @account.site_name = "hi"
    @account.should_not be_valid
  end
  
  it "should not be valid if site name is too long" do
    @account.site_name = "12345678901234567890123456789012345678901234567890123456" # 56 chars
    @account.should_not be_valid
  end
  
  after(:each) do
    @account = nil
  end
  
end
