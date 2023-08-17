FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password {"test123"}
  end
end
