# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.first_or_create(mobile_number:"0968762861", password:"password123")

patient1 = user.patients.find_or_create_by(name:"Ivan Ivanuik")
patient2 = user.patients.find_or_create_by(name:"Maria Martynuik")

doctor1 = Doctor.find_or_create_by(name:"Iryna Kuts", specializations:"Cardiologists")
doctor2 = Doctor.find_or_create_by(name:"Natalia Mechnykova", specializations:"Dermatologists")