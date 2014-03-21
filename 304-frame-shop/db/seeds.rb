# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Frame.create! material: "Black Satin",      price: 5.30
Frame.create! material: "Brentwood",        price: 8.60
Frame.create! material: "Fine Bamboo",      price: 11.80
Frame.create! material: "Town and Country", price: 6.10

OrderedFrame.create! material: "Town and Country", price: 6.10, 
hardware: true, inches: 2, frame_id: 4, total_price: 7.10