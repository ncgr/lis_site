require 'spec_helper'

describe UserProfilesController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  before(:all) do
    create_roles
  end

  describe "access restricted without logging in" do
    it "index should redirect" do
      get :index
      response.should be_redirect
    end
    it "destroy/:id should redirect" do
      delete :destroy, :id => "2"
      response.should be_redirect
    end
  end
 
  describe "GET index while logged in as superuser" do
    login_superuser
    it "should get index" do
      get :index
      response.should be_success
    end
  end

  describe "GET index while logged in as admin" do
    login_admin
    it "should get index" do
      get :index
      response.should be_success
    end
  end

  describe "GET index while logged in as editor" do
    login_editor
    it "should redirect" do
      get :index
      response.should be_redirect
    end
  end

  describe "GET index while logged in as system_user" do
    login_system_user
    it "should redirect" do
      get :index
      response.should be_redirect
    end
  end

  describe "GET manage_roles while logged in as admin" do
    login_admin
    it "should redirect" do
      get :manage_roles, :id => "12"
      response.should be_redirect
    end
  end

  describe "GET manage_roles while logged in as editor" do
    login_editor
    it "should redirect" do
      get :manage_roles, :id => "12"
      response.should be_redirect
    end
  end

  describe "GET manage_roles while logged in as system_user" do
    login_system_user
    it "should redirect" do
      get :manage_roles, :id => "12"
      response.should be_redirect
    end
  end

  describe "PUT roles while logged in as superuser" do
    login_superuser
    before(:each) do
      @user = Factory.build(:user_information)
      User.stub!(:find).with("7").and_return(@user)
      User.should_receive(:find).with("7").and_return(@user)
    end
    it "should find user and return object" do
      get :manage_roles, :id => "7"
      response.should render_template('manage_roles')
    end
    it "should update object" do
      put :update_roles, :id => "7", :user_role => {}
      response.should be_redirect
    end
  end

  describe "DELETE user while logged in as superuser" do
    login_superuser
    before(:each) do
      User.stub!(:find).with("8") { mock_user }
      mock_user.should_receive(:destroy).and_return(true)
    end
    it "should destroy object" do
      delete :destroy, :id => "8"
      response.should be_redirect
    end
  end

  after(:all) do
    destroy_roles  
  end
end
