FactoryGirl.define do
  factory :comment do
    body { Faker::Lorem.paragraphs.join("\n\n") }
  end
end
