require 'spec_helper'

#
# UserInformation uses the table Users. These tests should cover
# Users as well.
#
describe UserInformation do
  
  it "has zero records" do
    UserInformation.count.should == 0
  end
  
  it "fails validation with no username (using errors_on)" do
    Factory.build(:user_information,
      :username               => nil,
      :password               => "testing",
      :password_confirmation  => "testing",
      :first_name             => "bob",
      :last_name              => "bob"
    ).should have(1).error_on(:username)
  end
  
  it "fails validation with poorly formatted username (using errors_on)" do
    Factory.build(:user_information,
      :username               => "test@test",
      :password               => "testing",
      :password_confirmation  => "testing",
      :first_name             => "bob",
      :last_name              => "bob"
    ).should have(1).error_on(:username)
  end
  
  it "fails validation with no password (using errors_on)" do
    Factory.build(:user_information,
      :username               => "test@test.com",
      :password               => "",
      :password_confirmation  => "",
      :first_name             => "bob",
      :last_name              => "bob"
    ).should have(1).error_on(:password)
  end
  
  it "fails validation with no name (using errors_on)" do
    Factory.build(:user_information,
      :username               => "test@test.com",
      :password               => "testing",
      :password_confirmation  => "testing",
      :first_name             => "",
      :last_name              => "bob"
    ).should have(1).error_on(:first_name)
    Factory.build(:user_information,
      :username               => "test@test.com",
      :password               => "testing",
      :password_confirmation  => "testing",
      :first_name             => "bob",
      :last_name              => ""
    ).should have(1).error_on(:last_name)
  end
  
  it "fails creation without role (using raise_error)" do
    lambda { Factory.create(:user_information,
      :username               => "test@test.com",
      :password               => "testing",
      :password_confirmation  => "testing",
      :first_name             => "bob",
      :last_name              => "bob"
    ) }.should raise_error(RuntimeError)
  end
  
  it "passes creation with role" do
    create_roles
    Factory.create(:user_information)
    UserInformation.count.should == 1
  end
  
  it "has capitalized first and last name" do
    create_roles
    Factory.create(:user_information)
    @user = UserInformation.first
    @user.first_name.should == @user.first_name.capitalize
    @user.last_name.should == @user.last_name.capitalize
  end
  
  it "responds to email" do
    create_roles
    Factory.create(:user_information)
    @user = UserInformation.first
    @user.should respond_to(:email)
  end
end
