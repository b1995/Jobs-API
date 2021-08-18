FactoryBot.define do
    factory :job_application do
        cover_letter { Faker::Lorem.words }
        seen false
        job_post_id nil
        user_id nil
    end
end