require 'spec_helper'

describe NewsArticlesController do

  def mock_news_article(stubs={})
    @mock_news_article ||= mock_model(NewsArticle, stubs).as_null_object
  end

  before(:all) do
    create_roles
  end

  describe "GET index without logging in" do
    it "should get index" do
      get :index
      response.should be_success
    end
  end

  describe "GET show without logging in" do
    before(:each) do
      @news_article = Factory.build(:news_article)
      NewsArticle.stub!(:find).with("10").and_return(@news_article)
    end
    it "should get show" do
      get :show, :id => "10"
      response.should be_success
    end
  end

  describe "access restricted without logging in" do
    it "new should redirect" do
      get :new
      response.should be_redirect
    end
    it "create should redirect" do
      post :create
      response.should be_redirect
    end
    it "edit/:id should redirect" do
      get :edit, :id => "10"
      response.should be_redirect
    end
    it "update/:id should redirect" do
      put :update, :id => "10", :news_article => {}
      response.should be_redirect
    end
    it "destroy/:id should be redirect" do
      delete :destroy, :id => "10"
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
      post :create, :news_article => Factory.build(:news_article)
      response.should be_success
    end
  end

  describe "PUT news_article while logged in as superuser" do
    login_superuser
    before(:each) do
      @news_article = Factory.build(:news_article)
      NewsArticle.should_receive(:find).with("21").and_return(@news_article)
    end
    it "should find news_article and return object" do
      get :edit, :id => "21"
      response.should render_template('edit')
    end
    it "should update object" do
      put :update, :id => "21", :news_article => {} 
      response.should be_redirect
    end
  end

  describe "DELETE news_article while logged in as superuser" do
    login_superuser
    before(:each) do
      NewsArticle.stub!(:find).with("11") { mock_news_article }
      mock_news_article.should_receive(:destroy).and_return(true)
    end
    it "should destroy object" do
      delete :destroy, :id => "11"
      response.should be_redirect
    end
  end

  after(:all) do
    destroy_roles  
  end
end
