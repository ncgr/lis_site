require 'spec_helper'

describe DevelopmentActivitiesController do
  
  describe "GET index" do
    it "should get index" do
      get :index
      response.should be_success
    end
  end
  
end
