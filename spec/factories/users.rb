FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name   }
    email { Faker::Internet.email }
    image_url { Faker::Internet.url  }
    token { Faker::String.random(length: 24) }
  end
end
