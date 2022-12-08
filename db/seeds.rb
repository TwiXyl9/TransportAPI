# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
admin = Role.create!(name: 'admin')
user = Role.create!(name: 'user')
cargo_type = CargoType.create!(name: 'Pallets')
delivery_type = DeliveryType.create!(name: "Fast", price: 10)
capacity = Capacity.create!(width: 3, height: 3, length: 6, num_of_pallets: 10)
car = Car.create!(brand: 'Iveco', model: 'TurboDaily', capacity: capacity)
