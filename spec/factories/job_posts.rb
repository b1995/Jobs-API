FactoryBot.define do
    factory :job_post do
      title { Faker::Lorem.word }
      description { Faker::Lorem.words }
      expired{ Faker::Boolean.boolean(true_ratio: 0.7)}
    end
  end