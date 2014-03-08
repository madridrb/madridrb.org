# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    twitter { Faker::Internet.user_name }
    password "Fake1234"
    password_confirmation "Fake1234"
  end
end
