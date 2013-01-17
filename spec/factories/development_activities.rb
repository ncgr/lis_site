FactoryGirl.define do
  factory :development_activity do
    body "test one"
    date Date.parse("2011-01-01")
  end
end
