# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |i|
  Item.create!(title: "kitten#{i}", description: "So cute !", price: 5, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCavfQmw0-QJRuPXZH5al4kuxV3mgikInDeKrE4nHX03lFqz2B1g")
end
p "Created 20 items."
