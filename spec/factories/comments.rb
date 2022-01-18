FactoryBot.define do
  factory :comment do
    association :service, factory: :service
    association :user, factory: :user
    title { Faker::Book.title }
  end
end