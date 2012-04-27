require 'spec_helper'

describe "EditNewsArticles" do

  before(:each) do
    create_roles
    @news_article = FactoryGirl.create(:news_article)
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
    click_link "Manage News Articles"
    visit edit_news_article_path(@news_article.id)

    click_button "Update News Article"
    page.should have_content("Successfully updated news article.")
  end

  it "as admin" do
    @user = create_user("admin")
    visit root_path
    click_link "Sign In"
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => @user.password
    click_button "LOGIN"

    click_link @user.username
    click_link "Manage News Articles"
    visit edit_news_article_path(@news_article.id)

    click_button "Update News Article"
    page.should have_content("Successfully updated news article.")
  end

  it "as editor should fail" do
    @user = create_user("editor")
    visit root_path
    click_link "Sign In"
    fill_in "Username", :with => @user.username
    fill_in "Password", :with => @user.password
    click_button "LOGIN"

    click_link @user.username

    page.body.should_not include("Manage News Articles")

    visit edit_news_article_path(@news_article.id)
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

    page.body.should_not include("Manage News Articles")

    visit edit_news_article_path(@news_article.id)
    page.should have_content("Sorry, your account has insufficient privileges for the requested resource.")
  end

  after(:all) do
    Capybara.use_default_driver
  end

end
