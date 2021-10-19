FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name   }
    email { Faker::Internet.email }
    image_url { Faker::Internet.url  }
    token { Faker::Lorem.characters(number: 16) }
  end
end
