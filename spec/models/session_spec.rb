require 'spec_helper'

describe Session do

  before(:each) do
    @session = FactoryGirl.create(:session)
  end

  it "removes sessions where updated_at < 1 hour ago." do
    @session.updated_at = 2.hours.ago
    @session.save

    Session.sweep
    Session.count.should == 0
  end

  it "removes sessions where created_at < 2 days ago." do
    @session.created_at = 3.days.ago
    @session.save

    Session.sweep
    Session.count.should == 0
  end

  it "doesn't remove valid sessions" do
    Session.sweep
    Session.count.should == 1
  end

end
