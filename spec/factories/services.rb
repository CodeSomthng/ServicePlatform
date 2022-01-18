FactoryBot.define do
  factory :service do
    title { Faker::Book.title }
  end
end