require 'spec_helper'

describe "PasswordResets" do

  before(:all) { create_roles }
  before(:each) { clear_emails }

  it "emails user after successful password reset request" do
    user = Factory(:user_information)
    visit new_user_information_password_path
    fill_in "user_information_username", :with => user.username
    click_button "Send me reset password instructions"
    page.should have_content("instructions about how to reset your password shortly")
    last_email.to.should include(user.username)
  end

  it "does not email user after unsuccessful password reset request" do
    visit new_user_information_password_path
    fill_in "Username", :with => "i_am_a_robot@example.com"
    click_button "Send me reset password instructions"
    page.should have_content("receive a password recovery link")
    last_email.should be_nil
  end

  it "updates the password with correct confirmation" do
    user = Factory(:user_information, :reset_password_token => "token", :reset_password_sent_at => 1.hour.ago)
    visit edit_user_password_path(:reset_password_token => user.reset_password_token)
    fill_in "New password", :with => "nicepass"
    click_button "Change my password"
    page.should have_content("Password did not match")
    fill_in "New password", :with => "nicepass"
    fill_in "Confirm new password", :with => "nicepass"
    click_button "Change my password"
    current_path.should eq(user_profile_path(user.id))
    page.should have_content("Your password was changed successfully")
  end

  it "notifies user reset password token has expired" do
    user = Factory(:user_information, :reset_password_token => "token", :reset_password_sent_at => 12.hours.ago)
    visit edit_user_password_path(:reset_password_token => user.reset_password_token)
    fill_in "New password", :with => "nicepass"
    fill_in "Confirm new password", :with => "nicepass"
    click_button "Change my password"
    page.should have_content("Reset password token has expired")
  end
it "notifies user reset password token is blank" do
    user = Factory(:user_information, :reset_password_token => nil, :reset_password_sent_at => 12.hours.ago)
    visit edit_user_password_path(:reset_password_token => user.reset_password_token)
    fill_in "New password", :with => "nicepass"
    fill_in "Confirm new password", :with => "nicepass"
    click_button "Change my password"
    page.should have_content("Reset password token can't be blank")
  end

  it "notifies user reset password token is invalid" do
    user = Factory(:user_information, :reset_password_token => "token", :reset_password_sent_at => 12.hours.ago)
    visit edit_user_password_path(:reset_password_token => "badtoken")
    fill_in "New password", :with => "nicepass"
    fill_in "Confirm new password", :with => "nicepass"
    click_button "Change my password"
    page.should have_content("Reset password token is invalid")
  end

  it "resets password with valid token" do
    user = Factory(:user_information, :reset_password_token => "token", :reset_password_sent_at => 1.hours.ago)
    visit edit_user_password_path(:reset_password_token => user.reset_password_token)
    fill_in "New password", :with => user.password
    fill_in "Confirm new password", :with => user.password
    click_button "Change my password"
    current_path.should eq(user_profile_path(user.id))
    page.should have_content("password was changed successfully")
  end

  after(:all) { destroy_roles }

end

