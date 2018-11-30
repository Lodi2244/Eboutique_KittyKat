require "nokogiri"
require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat_imgs = Array.new
n = 0

doc = Nokogiri::HTML(open("http://www.cutestpaw.com/tag/cats/"))
doc.css("#photos > a > img").each do |link|
  cat_imgs[n] = link.attr("src")
  n += 1
end

20.times do |i|
  Item.create!(title: "kitten#{i}", description: "So cute !", price: 5, image_url: cat_imgs[i])
end
p "Created 20 items."

User.destroy_all
p "Create Test User"
user = User.create(email: "RoxyFoxy2244@gmail.com", password: "Xxxxxxx", password_confirmation: "Xxxxxxx")
