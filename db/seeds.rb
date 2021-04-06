# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@easypep.de', password: 'welcome', password_confirmation: 'welcome')
User.create(email: 'user1@lekkercode.com', password: 'password1', password_confirmation: 'password1')
User.create(email: 'user2@lekkercode.com', password: 'password2', password_confirmation: 'password2')
User.create(email: 'user3@lekkercode.com', password: 'password3', password_confirmation: 'password3')
