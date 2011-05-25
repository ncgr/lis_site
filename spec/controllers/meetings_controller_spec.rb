require 'spec_helper'

describe MeetingsController do

  def mock_meeting(stubs={})
    @mock_meeting ||= mock_model(Meeting, stubs).as_null_object
  end

  before(:all) do
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
    it "redirects to home page" do
      get :index
      response.should be_redirect
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

  describe "POST new while logged in as superuser" do
    login_superuser
    it "should create new object" do
      post :create, :meeting => Factory.build(:meeting)
      response.should be_success
    end
  end

  describe "PUT meeting while logged in as superuser" do
    login_superuser
    before(:each) do
      @meeting = Factory.build(:meeting)
      Meeting.stub!(:find).with("1").and_return(@meeting)
      Meeting.should_receive(:find).with("1").and_return(@meeting)
    end
    it "should find meeting and return object" do
      get :edit, :id => "1"
      response.should render_template('edit')
    end
    it "should update object" do
      put :update, :id => "1", :meeting => {}
      response.should be_redirect
    end
  end

  describe "DELETE meeting while logged in as superuser" do
    login_superuser
    before(:each) do
      Meeting.stub!(:find).with("1") { mock_meeting }
      mock_meeting.should_receive(:destroy).and_return(true)
    end
    it "should destroy object" do
      delete :destroy, :id => "1"
      response.should be_redirect
    end
  end

  after(:all) do
    destroy_roles  
  end
end
