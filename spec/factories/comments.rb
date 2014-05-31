FactoryGirl.define do
  factory :comment do
    user_name { Faker::Name.name }
    body { Faker::Lorem.paragraphs.join("\n\n") }
  end
end
