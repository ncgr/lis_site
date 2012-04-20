require 'spec_helper'

describe MeetingsController do

  def mock_meeting(stubs={})
    @mock_meeting ||= mock_model(Meeting, stubs).as_null_object
  end

  before(:each) do
    create_roles
  end

  describe "access restricted without logging in" do
    it "index should redirect" do
      get :index
      response.should be_redirect
    end
    it "new should redirect" do
      get :new
      response.should be_redirect
    end
    it "create should redirect" do
      post :create, :meeting => {}
      response.should be_redirect
    end
    it "edit/:id should redirect" do
      get :edit, :id => "2"
      response.should be_redirect
    end
    it "update/:id should redirect" do
      put :update, :id => "2"
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
    it "redirects to home page" do
      get :index
      response.should be_redirect
    end
  end

  describe "GET index while logged in as system_user" do
    login_system_user
    it "redirects to home page" do
      get :index
      response.should be_redirect
    end
  end

  describe "GET new while logged in as superuser" do
    login_superuser
    it "should get new" do
      get :new
      response.should render_template('new')
    end
  end

  describe "GET new while logged in as admin" do
    login_admin
    it "should get new" do
      get :new
      response.should render_template('new')
    end
  end

end
