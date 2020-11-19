FactoryBot.define do
  factory :category do
    title { FFaker::Book.genre }
    description { FFaker::Book.title }
  end
end
