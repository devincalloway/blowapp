# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    title "MyString"
    url "MyString"
    body "MyText"
    slug "MyString"
    user_id 1
    category_id 1
  end
end
