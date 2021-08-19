FactoryBot.define do
    factory :job_post do
      title { Faker::Lorem.word }
      description { Faker::Lorem.words }
    end
  end