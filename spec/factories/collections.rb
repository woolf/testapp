# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :collection do
    name "Collection name"
    user_id 1
  end
  factory :collections do
    name "Collection2 name"
    user_id 2
  end
end
