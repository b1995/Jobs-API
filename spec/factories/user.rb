FactoryBot.define do
        factory :user do
          email 'test@test.com'
          password 'test123'
          admin true
        end
      end
    