require 'spec_helper'

describe "EditPages" do

  before(:each) do
    create_roles
    @page = FactoryGirl.create(:page)
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
    click_link "Manage Pages"
    visit edit_page_path(@page.id)

    click_button "Update #{@page.title.capitalize}"
    page.should have_content("Page updated successfully.")
  end

  it "as admin" do
    @user = create_user("admin")
    visit root_path
    click_link "Sign In"
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => @user.password
    click_button "LOGIN"

    click_link @user.username
    click_link "Manage Pages"
    visit edit_page_path(@page.id)

    click_button "Update #{@page.title.capitalize}"
    page.should have_content("Page updated successfully.")
  end

  it "as editor should fail" do
    @user = create_user("editor")
    visit root_path
    click_link "Sign In"
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => @user.password
    click_button "LOGIN"

    click_link @user.username
    page.body.should_not include("Manage Pages")

    visit edit_page_path(@page.id)
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
    page.body.should_not include("Manage Pages")

    visit edit_page_path(@page.id)
    page.should have_content("Sorry, your account has insufficient privileges for the requested resource.")
  end

  after(:all) do
    Capybara.use_default_driver
  end

end
