require 'spec_helper'

describe DevelopmentActivity do
  it "has zero records" do
    DevelopmentActivity.count.should == 0
  end
  
  it "has one record" do
    DevelopmentActivity.create!(:body => "test one", :date => Date.parse("2011-01-01"))
    DevelopmentActivity.count.should == 1
  end
end
