require 'spec_helper'

describe "ManagerUsers" do

  before(:each) do
    create_roles
    clear_emails
    set_host
  end

  it "as superuser can update roles" do
    @user = create_user("superuser")
    visit root_path
    click_link "Sign In"
    click_link @user.username
    click_link "Manage users"
    click_link "Manage Roles"

    # Check all available roles.
    check "user_role_"
    click_button "Update Roles"
    page.should have_content("Successfully updated roles.")
  end

  it "as superuser creates a new user" do
    observer = UserInformationObserver.instance

    @user = create_user("superuser")
    visit root_path
    click_link "Sign In"
    click_link @user.username
    click_link "Create user"

    fill_in "user_information_username", :with => "newuser@test.com"
    fill_in "user_information_password", :with => "testing"
    fill_in "user_information_password_confirmation", :with => "testing"
    fill_in "user_information_first_name", :with => "test"
    fill_in "user_information_last_name", :with => "test"
    click_button "Register"
    page.should have_content("Welcome! You have signed up successfully. Please sign in to continue.")

    observer.after_create(UserInformation.last)
    last_email.to.should include("newuser@test.com")
  end

  it "as admin creates a new user" do
    observer = UserInformationObserver.instance

    @user = create_user("admin")
    visit root_path
    click_link "Sign In"
    click_link @user.username
    click_link "Create user"

    fill_in "user_information_username", :with => "newuser@test.com"
    fill_in "user_information_password", :with => "testing"
    fill_in "user_information_password_confirmation", :with => "testing"
    fill_in "user_information_first_name", :with => "test"
    fill_in "user_information_last_name", :with => "test"
    click_button "Register"
    page.should have_content("Welcome! You have signed up successfully. Please sign in to continue.")

    observer.after_create(UserInformation.last)
    last_email.to.should include("newuser@test.com")
  end

  it "as admin can view users but not update roles" do
    @user = create_user("admin")
    visit root_path
    click_link "Sign In"
    click_link @user.username
    click_link "View users"

    page.body.should_not include("Manage Roles")
  end

  it "edits user account as editor" do
    @user = create_user("editor")
    visit root_path
    click_link "Sign In"
    click_link @user.username

    page.body.should_not include("Create user")
    page.body.should_not include("View users")
    page.body.should_not include("Manager users")

    click_link "Edit your registration information"
    click_button "Update"
    page.should have_content("Current password can't be blank")

    fill_in "user_information_password", :with => @user.password
    fill_in "user_information_password_confirmation", :with => @user.password
    fill_in "user_information_current_password", :with => @user.password
    click_button "Update"
    page.should have_content("You updated your account successfully.")
  end

  it "edits user account as system_user" do
    @user = create_user("system_user")
    visit root_path
    click_link "Sign In"
    click_link @user.username

    page.body.should_not include("Create user")
    page.body.should_not include("View users")
    page.body.should_not include("Manager users")

    click_link "Edit your registration information"
    click_button "Update"
    page.should have_content("Current password can't be blank")

    fill_in "user_information_password", :with => @user.password
    fill_in "user_information_password_confirmation", :with => @user.password
    fill_in "user_information_current_password", :with => @user.password
    click_button "Update"
    page.should have_content("You updated your account successfully.")
  end

  it "as editor cannot manager users" do
    @user = create_user("editor")
    visit root_path
    click_link "Sign In"
    click_link @user.username
    visit user_profiles_path
    page.body.should have_content("Sorry, your account has insufficient privileges for the requested resource.")

    visit manage_roles_user_profile_path(@user)
    page.body.should have_content("Sorry, your account has insufficient privileges for the requested resource.")
  end

  it "as system_user cannot manager users" do
    @user = create_user("system_user")
    visit root_path
    click_link "Sign In"
    click_link @user.username
    visit user_profiles_path
    page.body.should have_content("Sorry, your account has insufficient privileges for the requested resource.")

    visit manage_roles_user_profile_path(@user)
    page.body.should have_content("Sorry, your account has insufficient privileges for the requested resource.")
  end

end
