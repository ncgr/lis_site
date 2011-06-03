require 'spec_helper'

describe PagesController do

  before(:all) do
    create_roles
  end

  describe "GET index without logging in" do
    it "redirects to home page" do
      get :index
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

  describe "Show page while not logged in" do
    before(:each) do
      @page = Factory.build(:page)
      Page.stub!(:find).with("about").and_return(@page)
    end
    it "should show page" do
      get :show, :id => "about"
      response.should be_success
    end
  end

  describe "PUT meeting while logged in as superuser" do
    login_superuser
    before(:each) do
      @page = Factory.build(:page)
      Page.should_receive(:find).with("1").and_return(@page)
    end
    it "should find meeting and return object" do
      get :edit, :id => "1"
      response.should render_template('edit')
    end
    it "should update object" do
      put :update, :id => "1", :page => {}
      response.should be_redirect
    end
  end

  after(:all) do
    destroy_roles  
  end
end
