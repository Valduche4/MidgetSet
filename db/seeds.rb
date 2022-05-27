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

adresses = ["Chaussée de boitsfort 140, Bruxelles", "Avenue Baron d'huart 35, Bruxelles", "Rue du merlo 200, Uccle", "becentral", "Chaussée de Malines 302, Bruxelles", "Avenue de tervuren 300, Bruxelles"]

12.times do
  dwarf = Dwarf.new(
    user: user,
    name: Faker::Name.name,
    sexe: "male",
    origin: Faker::WorldCup.team,
    age: rand(1..100),
    size: rand(1...150),
    description: Faker::Lorem.sentence,
    price: rand(1...200),
    address: adresses.sample
  )
  dwarf.photo.attach(io: File.open(URI.open("https://i.pinimg.com/originals/7f/1c/86/7f1c86c116ec6436a04f891b090d0e6b.png")), filename: 'file.jpeg')
  dwarf.save!

  JobDwarf.create(dwarf: dwarf, job: jobs.sample)
end
