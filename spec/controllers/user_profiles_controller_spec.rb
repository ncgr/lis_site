require 'spec_helper'

describe UserProfilesController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  before(:each) do
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

  context "with render_views" do
    render_views
    describe "GET index while logged in as superuser" do
      login_superuser
      it "should get index" do
        get :index
        response.should be_success
      end
      it "should contain Action in the body" do
        get :index
        response.body.should =~ /Action/
      end
    end

    describe "GET index while logged in as admin" do
      login_admin
      it "should get index" do
        get :index
        response.should be_success
      end
      it "should not contain Action in the body" do
        get :index
        response.should_not =~ /Action/
      end
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
    it "should get show" do
      get :show, :id => @user.id
      response.should be_success
    end
    before(:each) do
      @user = User.includes(:roles).where("roles.name != 'superuser'").first
    end
    it "should get show on any user account" do
      get :show, :id => @user.id
      response.should be_success
    end
  end

  describe "GET show while logged in as admin" do
    login_admin
    before(:each) do
      @user = User.order("created_at DESC").first
      User.should_receive(:find).with(@user.id).and_return(@user)
    end
    it "should get show" do
      get :show, :id => @user.id
      response.should be_success
    end
  end

  describe "GET show while logged in as editor" do
    login_editor
    before(:each) do
      @user = User.order("created_at DESC").first
      User.should_receive(:find).with(@user.id).and_return(@user)
    end
    it "should get show" do
      get :show, :id => @user.id
      response.should be_success
    end
  end

  describe "GET show while logged in as system_user" do
    login_system_user
    before(:each) do
      @user = User.order("created_at DESC").first
      User.should_receive(:find).with(@user.id).and_return(@user)
    end
    it "should get show" do
      get :show, :id => @user.id
      response.should be_success
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

end
