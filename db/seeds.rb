# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

Formula.destroy_all
DailyEmotion.destroy_all
Event.destroy_all
Emotion.destroy_all
Place.destroy_all
User.destroy_all
puts "Formulas, Places, Users, Emotions and DailyEmotion destroyed"



karim =   User.create!(
    id: 1,
    email: "karim@tester.com",
    first_name: "Karim",
    last_name: "Fathi",
    password: "1234567",
    password_confirmation: "1234567",
    training_number: "0"
)

karimcoach =   Coach.create!(
    user_id: "1"
)



tarik =   User.create!(
    id: 2,
    email: "tarik@tester.com",
    first_name: "Tarik",
    last_name: "Yacoubi",
    password: "1234567",
    password_confirmation: "1234567",
    training_number: "0"
)

tarikcoach =   Coach.create!(
    user_id: "2"
)


tuileries =   Place.create!(
    id: 1,
    name: "Jardin des Tuileries",
    avatar: "https://res.cloudinary.com/dt6csu5lm/image/upload/v1600423062/kirsten-drew-NIGy5J-pQJs-unsplash_it4p4n.jpg",
    description: "Jardin des Tuileries",
    user_id: "1"
  )

tuileries.save!


mars =   Place.create!(
    id: 2,
    name: "Champ de Mars",
    avatar: "https://res.cloudinary.com/dt6csu5lm/image/upload/v1600423049/il-vagabiondo-FlkxnZdebMk-unsplash_pt4tqb.jpg",
    description: "Champ de Mars",
    user_id: "1"
  )

mars.save!

luxembourg =   Place.create!(
    id: 3,
    name: "Jardin du Luxembourg",
    avatar: "https://res.cloudinary.com/dt6csu5lm/image/upload/v1600423075/sami-zoller-SfiMSXg7BXg-unsplash_ttkg66.jpg",
    description: "Jardin du Luxembourg",
    user_id: "1"
  )

luxembourg.save!

10.times do
  Event.create(
    title: "Boxe",
    event_date: Faker::Date.forward(days: 7*rand(1..50)),
    start_at: Time.now,
    end_at: Time.now + 1*60*60,
    duration: "1",
    description: Faker::Lorem.sentence(word_count: rand(20..100)),
    place_id: "1"
  )
end


3.times do
  User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "1234567",
    password_confirmation: "1234567",
    training_number: "0"
)
end

10.times do
  Event.create(
    title: "Fit",
    event_date: Faker::Date.forward(days: 7*rand(1..50)),
    start_at: Time.now,
    end_at: Time.now + 1*60*60,
    duration: "1",
    description: Faker::Lorem.sentence(word_count: rand(20..100)),
    place_id: "2"
  )
end

Emotion.create!(id:1, rating: 1)
Emotion.create!(id:2, rating: 2)
Emotion.create!(id:3,rating: 3)
Emotion.create!(id:4,rating: 4)
Emotion.create!(id:5,rating: 5)

puts "Places, Users, Emotions and DailyEmotion created"

