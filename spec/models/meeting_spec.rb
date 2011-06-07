require 'spec_helper'

describe Meeting do
  it "has zero records" do
    Meeting.count.should == 0
  end
  
  it "fails validation with no title, url, start_date and end_date (using error_on)" do
    Meeting.new.should have(1).error_on(:title)
    Meeting.new.should have(1).error_on(:url)
    Meeting.new.should have(1).error_on(:start_date)
    Meeting.new.should have(1).error_on(:end_date)
  end
  
  it "fails validation with poorly formatted start and end dates (using error_on)" do
    Meeting.new(
      :title => "one", 
      :url => "http://google.com", 
      :start_date => "2001-01",
      :end_date => "2001-01-01"
    ).should have(1).error_on(:start_date)
    
    Meeting.new(
      :title => "one", 
      :url => "http://google.com", 
      :start_date => "2001-01-01",
      :end_date => "2001-01"
    ).should have(1).error_on(:end_date)
  end
  
  it "has one record" do
    Factory.create(:meeting)
    Meeting.count.should == 1
  end
end