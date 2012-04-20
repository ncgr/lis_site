FactoryGirl.define do
  factory :news_article do
    title "test"
    body "testing"
    created_at Time.now
  end
end
