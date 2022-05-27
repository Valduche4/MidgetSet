# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "faker"
Dwarf.destroy_all
User.destroy_all
Job.destroy_all
JobDwarf.destroy_all


file = URI.open("https://picsum.photos/400/600")
jobs = Job.create([{ name: "Wrestler" }, { name: "Stripteaser"}, { name: "Cosplay"}, { name: "Darts"}, { name: "Canonman"}, { name: "Friend"}, { name: "Bachelor animator"}, { name: "Singer"}])

user = User.create(username: "val", email: "hello@leo.com", password: "123456")

20.times do
  dwarf = Dwarf.new(
    user: user,
    name: Faker::Name.name,
    sexe: "male",
    origin: Faker::WorldCup.team,
    age: rand(1..100),
    size: rand(1...150),
    description: Faker::Lorem.sentence,
    price: rand(1...200),
    city: Faker::WorldCup.city
  )
  dwarf.photo.attach(io: File.open(URI.open("https://picsum.photos/400/600")), filename: 'file.jpeg')
  dwarf.save!

  JobDwarf.create(dwarf: dwarf, job: jobs.sample)
end
