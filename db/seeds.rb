require "faker"

puts 'Cleaning all databases ...'

Booking.destroy_all
Artwork.destroy_all
Profile.destroy_all
User.destroy_all


puts 'Creating 15 fake Users and associated Profiles, Artworks and Bookings ...'

index = 0
20.times do
  index = 0 if index > 9
  index += 1
  user = User.create!(email: Faker::Internet.email, password: 'topsecret', password_confirmation: 'topsecret')
  Profile.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user: user)
  art = Artwork.create!(kind: Faker::Quote.singular_siegler, title: Faker::Games::Pokemon.name, description: Faker::Quote.most_interesting_man_in_the_world, tagline: Faker::Games::Pokemon.move, image: "http://lorempixel.com/400/400/abstract/#{index}", price: 50, width: 20, height: 10, user: user)
  Booking.create!(status: "available", artwork: art, user: user)
end

puts 'Finished!'

