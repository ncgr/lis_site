FactoryGirl.define do
  factory :user_information do
    username "test@test.com"
    password "testing"
    password_confirmation "testing"
    first_name "bob"
    last_name "smith"
  end
end
