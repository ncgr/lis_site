require 'spec_helper'

describe UserProfilesController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  #
  # Descode signed cookies created after a user successfully logs in.
  # app/controllers/application_controller.rb
  #
  def decode_signed_cookie(cookie)
    Base64.decode64(cookie.split('--').first).gsub(/[^a-z]/, '')
  end

  before(:all) do
    create_roles
  end

  describe "access restricted without logging in" do
    it "index should redirect" do
      get :index
      response.should be_redirect
    end
    it "show/:id should redirect" do
      get :show, :id => "5"
      response.should be_redirect
    end
    it "manage_roles/:id should redirect" do
      get :manage_roles, :id => "8"
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

  describe "GET show while logged in as superuser" do
    login_superuser
    before(:each) do
      @user = User.order("created_at DESC").first 
      User.should_receive(:find).with(@user.id).and_return(@user)
    end
    it "should get show and set ckfinder_role cookie" do
      request.cookies['ckfinder_role'] = nil
      get :show, :id => @user.id
      response.should be_success
      decode_signed_cookie(response.cookies['ckfinder_role']).should == "superuser"
    end
  end

  describe "GET show while logged in as admin" do
    login_admin
    before(:each) do
      @user = User.order("created_at DESC").first
      User.should_receive(:find).with(@user.id).and_return(@user)
    end
    it "should get show and set ckfinder_role cookie" do
      request.cookies['ckfinder_role'] = nil
      get :show, :id => @user.id
      response.should be_success
      decode_signed_cookie(response.cookies['ckfinder_role']).should == "admin"
    end
  end

  describe "GET show while logged in as editor" do
    login_editor
    before(:each) do
      @user = User.order("created_at DESC").first
      User.should_receive(:find).with(@user.id).and_return(@user)
    end
    it "should get show and set ckfinder_role cookie" do
      request.cookies['ckfinder_role'] = nil
      get :show, :id => @user.id
      response.should be_success
      decode_signed_cookie(response.cookies['ckfinder_role']).should == "editor"
    end
  end

  describe "GET show while logged in as system_user" do
    login_system_user
    before(:each) do
      @user = User.order("created_at DESC").first
      User.should_receive(:find).with(@user.id).and_return(@user)
    end
    it "should get show and set ckfinder_role cookie" do
      request.cookies['ckfinder_role'] = nil
      get :show, :id => @user.id
      response.should be_success
      decode_signed_cookie(response.cookies['ckfinder_role']).should == "systemuser"
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
