require 'spec_helper'

describe Page do
  it "has zero records" do
    Page.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:page)
    Page.count.should == 1
  end
end
