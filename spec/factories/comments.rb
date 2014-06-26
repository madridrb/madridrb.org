FactoryGirl.define do
  factory :comment do
    ignore do
      user { create :user }
    end

    user_id { user.id }
    user_name { user.name }
    body { Faker::Lorem.paragraphs.join("\n\n") }
  end
end
