require 'spec_helper'

describe NewsArticle do
  it "has zero records" do
    NewsArticle.count.should == 0
  end

  it "fails validation with no title and body (using error_on)" do
    NewsArticle.new.should have(1).error_on(:title)
    NewsArticle.new.should have(1).error_on(:body)
  end

  it "has one record" do
    FactoryGirl.create(:news_article)
    NewsArticle.count.should == 1
  end
end
