# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "faker"
file = URI.open("https://picsum.photos/400/600")
jobs = Job.create([{ name: "Wrestler" }, { name: "Stripteaser"}, { name: "Cosplay"}, { name: "Darts"}, { name: "Canonman"}, { name: "Friend"}, { name: "Bachelor animator"}, { name: "Signer"}])

# 20.times do
#   dwarf = Dwarf.new(
#     name: Faker::Name.name,
#     sexe: "male",
#     origin: Faker::WorldCup.team,
#     age: rand(1..100),
#     size: rand(1...150),
#     description: Faker::Lorem.sentence,
#     price: rand(1...200),
#     city: Faker::WorldCup.city
#   )
#   dwarf.jobs.name = jobs.name.rand
#   dwarf.photo.attach(io: file, filename: "valentine.png", content_type: "image/png")
#   dwarf.save!
# end
