FactoryGirl.define do
  factory :news_article do
    title "test"
    body "testing"
    timestamp Time.now
  end
end
