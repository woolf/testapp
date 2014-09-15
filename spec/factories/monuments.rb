# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :monument do
    name "MyString"
    description "MyText"
    category_id 1
  end
end
