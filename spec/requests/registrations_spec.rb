require 'spec_helper'

describe "Registrations" do

  before(:each) do
    create_roles
    clear_emails
  end

  #
  # I need to use UserObserver.instance to test email delivery.
  #
  it "emails and sign user in after successful registration" do
    observer = UserInformationObserver.instance

    visit root_path
    click_link "Register"
    current_path.should eq(new_user_information_registration_path)

    fill_in "user_information_username", :with => "testing@test.com"
    fill_in "user_information_password", :with => "testing"
    fill_in "user_information_password_confirmation", :with => "testing"
    fill_in "user_information_first_name", :with => "Test"
    fill_in "user_information_last_name", :with => "User"
    click_button "Register"

    current_path.should eq(root_path)
    page.should have_content("You have signed up successfully")

    observer.after_create(UserInformation.last)
    last_email.to.should include("testing@test.com")
  end

end

