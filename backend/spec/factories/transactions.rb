FactoryBot.define do
  factory :transaction do
    title { FFaker::Movie.title }
    description { FFaker::CheesyLingo.words }
    type { %w[:income, :outcome] }
    date { FFaker::Time.date }
    value { FFaker::Random.rand(1000..10000) }
  end
end
