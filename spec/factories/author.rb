FactoryGirl.define do
  factory :author do
    name { Faker::Name.name }
    twitter { Faker::Internet.user_name }
    url { Faker::Internet.http_url }
    bio { Faker::Lorem.paragraphs.join("\n\n") }
  end
end
