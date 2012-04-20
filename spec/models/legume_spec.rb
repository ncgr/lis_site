require 'spec_helper'

describe Legume do
  it "has zero records" do
    Legume.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:legume)
    Legume.count.should == 1
  end
end
