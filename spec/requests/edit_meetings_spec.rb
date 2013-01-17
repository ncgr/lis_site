require 'spec_helper'

describe "EditMeetings" do

  before(:each) do
    create_roles
    @meeting = FactoryGirl.create(:meeting)
    Capybara.current_driver = :selenium
    set_host "silicon.ncgr.org:53330"
  end

  it "as superuser" do
    @user = create_user("superuser")
    visit root_path
    click_link "Sign In"
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => @user.password
    click_button "LOGIN"

    click_link @user.username
    click_link "Manage Meetings"
    visit edit_meeting_path(@meeting.id)

    click_button "Update Meeting"
    page.should have_content("Successfully updated meeting.")
  end

  it "as admin" do
    @user = create_user("admin")
    visit root_path
    click_link "Sign In"
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => @user.password
    click_button "LOGIN"

    click_link @user.username
    click_link "Manage Meetings"
    visit edit_meeting_path(@meeting.id)

    click_button "Update Meeting"
    page.should have_content("Successfully updated meeting.")
  end

  it "as editor should fail" do
    @user = create_user("editor")
    visit root_path
    click_link "Sign In"
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => @user.password
    click_button "LOGIN"

    click_link @user.username

    page.body.should_not include("Manage Meetings")

    visit edit_meeting_path(@meeting.id)
    page.should have_content("Sorry, your account has insufficient privileges for the requested resource.")
  end

  it "as system_user should fail" do
    @user = create_user("system_user")
    visit root_path
    click_link "Sign In"
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => @user.password
    click_button "LOGIN"

    click_link @user.username

    page.body.should_not include("Manage Meetings")

    visit edit_meeting_path(@meeting.id)
    page.should have_content("Sorry, your account has insufficient privileges for the requested resource.")
  end

  after(:all) do
    Capybara.use_default_driver
  end

end