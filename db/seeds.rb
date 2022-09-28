require 'faker'

user = User.create!(
  email:      'janedoe@random.com',
  first_name: Faker::Name.first_name,
  last_name:  Faker::Name.last_name,
  password: 'password'
)

Event.create!(
  name: Faker::Lorem.word,
  description: Faker::Lorem.sentence,
  start_date: Time.now,
  end_date:  Time.now,
  user: user
)
