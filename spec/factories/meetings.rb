# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting do
    title { Faker::Lorem.words.join(' ') }
    description { Faker::Lorem.paragraphs.join("\n\n") }
    starts_at { rand(10).days.from_now }
    venue { Faker::Address.street_address }
    author { build :author }
  end
end
