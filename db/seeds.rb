# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Equipment.destroy_all
User.destroy_all

user = User.create!(
    email: "mailys_94@hotmail.com",
    password: 123456,
    first_name: "Mailys",
    last_name: "Renson",
    phone_number: Faker::PhoneNumber.cell_phone,
    birthdate: Faker::Date.birthday,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    country: Faker::Address.country,
    bank_account: Faker::Bank.account_number
  )

4.times do
  p user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    birthdate: Faker::Date.birthday,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    country: Faker::Address.country,
    bank_account: Faker::Bank.account_number
  )
end

require "open-uri"

20.times do
  equipment = Equipment.new(
    name: ["basketball", "basketball jersey","knee pads", "soccer ball", "goalie gloves", "stop watch",
      "shin guards", "soccer jersey", "tennis racket", "tennis ball", "badminton racket"].sample,
    price: Faker::Commerce.price,
    description: Faker::Lorem.sentence,
    user_id: (User.all).sample.id,
    address: "212 Oude baan, Paal"
  )
   file = URI.open("http://i.ebayimg.com/images/i/182187766628-0-1/s-l1000.jpg")
  p file
  equipment.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  p equipment.save!
end


3.times do
  booking = Booking.create!(
    start_date: Faker::Date.between(from: Date.today-1.year, to: Date.today-6.months),
    end_date: Faker::Date.between(from: Date.today-6.months, to: Date.today),
    status: Booking::STATUS.sample,
    user: User.all.sample,
    equipment: Equipment.all.sample
  )
end
