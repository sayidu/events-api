FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { 'password' }
  end
end

FactoryBot.define do
  factory :event do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    start_date { Date.today }
    end_date { Date.today }
    user
  end
end


FactoryBot.define do
  factory :attendee do
    event
    user
  end
end


