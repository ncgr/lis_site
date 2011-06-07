require 'spec_helper'

describe DevelopmentActivity do
  it "has zero records" do
    DevelopmentActivity.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:development_activity)
    DevelopmentActivity.count.should == 1
  end
end
