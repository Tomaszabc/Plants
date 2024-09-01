# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Plant.create(name: "Rose")
Plant.create(name: "Tulip")

WateringDate.create(watering_time: DateTime.now, plant_id: Plant.first.id)
WateringDate.create(watering_time: DateTime.now - 1.day, plant_id: Plant.last.id)

User.create(email: "admin3@example.com", password: "password", password_confirmation: "password")
