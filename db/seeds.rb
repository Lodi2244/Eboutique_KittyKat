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

p "Start scrap"

doc = Nokogiri::HTML(open("http://www.cutestpaw.com/tag/cats/page/4/"))
doc.css("#photos > a > img").each do |link|
  p cat_imgs[n] = link.attr("src")
  n += 1
end

p "Adding 20 links to database"


20.times do |i|
  Item.create!(title: "Kitten #{i}", description: "So cute ! Buy this picture now !", price: 199, image_url: cat_imgs[i])
end

p "DONE !"

User.destroy_all
p "Create Test User"
user = User.create(email: "RoxyFoxy2244@gmail.com", password: "Xxxxxxx", password_confirmation: "Xxxxxxx")
