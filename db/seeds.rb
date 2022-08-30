# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

List.destroy_all
Release.destroy_all
User.destroy_all

puts = "Creating a user"
denis = User.create(email: "denis@gmail.com", password: "denis123")

puts = "Creating 3 default lists"

heard = List.new(title: "heard")
heard.user = denis
heard.save!

spotlight = List.new(title: "spotlight")
spotlight.user = denis
spotlight.save!

buy = List.new(title: "buy")
buy.user = denis
buy.save!

puts = "Creating 3 releases"

third_nature = Release.new(
  artist: "Roza Terenzi"
  title: "Third Nature"
  label: "	Step Ball Chain"
  catalog_number: "STEP04"
  format: 'Vinyl, 12", 33 ⅓ RPM'
  released: "2022-01-19"
  styles: ["Downtempo", "Techno", "Drum n Bass"]
  tracklist: ["Bedtime Ritual", "Geysers", "Memories Of The Secret", "Triptych"]
  cover_url: "https://i.discogs.com/_NgAEPPVJWqeqGQkitn9xXMK9jK8usliqioC_6KmnZE/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTIxODg0/ODkwLTE2NDMxMjUz/MjItNzMyOS5qcGVn.jpeg"
)

third_nature.list = spotlight
third_nature.save!



bikepictures = ["isert url's"]

locations = ["Berlin", "Hamburg", "Munich"]

puts 'Creating 10 fake bikes...'
30.times do
  bike = Bike.new(
    title: Faker::Company.name,
    price: rand(10..50),
    address: locations.sample
    # insert pull picture from bp when new bike is created.
    # if Bike.new = true
    #   # get from bikepictures
    # end
  )
  bike.user = users.sample
  bike.save!

  puts 'Creating a fake booking'
  1.times do
    booking = Booking.create(
      user: users.sample,
      bike: bike
    )
  end
end

puts 'Finished!'
