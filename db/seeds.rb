# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

Place.destroy_all
# User.destroy_all
puts "Places and Users destroyed"


# 3.times do
#   User.create!(
#     email: Faker::Internet.email,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     password: "1234567",
#     password_confirmation: "1234567"
# )
# end


2.times do
  Place.create!(
    name: Faker::Superhero.name,
    avatar: Faker::LoremFlickr.image,
    description: Faker::Lorem.sentence(word_count: rand(20..100)),
    user_id: "10"
    )
end

louvre =   Place.create!(
    name: "Louvre",
    avatar: "https://lh3.googleusercontent.com/proxy/vuSlRRLGe70YRMO8EeI3gEaxNbuIJ6pw4PUlbL0o05XSTDads5TwUySzSmuymiORji8JsSwAhXuixi-5eyBoEWvQMYoLVZsJtmNJ4Zie9IN7YVlcvdzqU1i4HXC7GnzoOTI",
    description: "Jardin des Tuileries",
    user_id: "10"
  )

louvre.save!

puts "Places and Users created"
