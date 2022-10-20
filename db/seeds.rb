# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# User.create(name:'test', email: 'test@test.com', password: '1234567')

user = User.create(name: 'Artur', email:'art@email.com', password: '123456')

# doctors
Tamara = Doctor.create(
  name: 'Tamara Sasianda',
  speciality: 'Pediatry',
  image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fak.picdn.net%2Fshutterstock%2Fvideos%2F6999817%2Fthumb%2F1.jpg&f=1&nofb=1&ipt=93953c1c904f42f29cd6472a0309a1e4ca45a39ebe98060eb526f1f75e5bea76&ipo=images',
  email: 'tamara@email.com',
  location: 'Lusaka',
)

Emmanuel = Doctor.create(
  name: 'Emmanuel Mensah',
  speciality: 'Orthopedic Surgeon',
  image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fthumbs.dreamstime.com%2Fz%2Fafrican-doctor-14739009.jpg&f=1&nofb=1&ipt=87f3c0cb6e3e54af693cf1f204e02ad5a0a83a29932944131fe712ccd80710e2&ipo=images',
  email: 'tamara@email.com',
  location: 'Ghana',
)

Jivago = Doctor.create(
  name: 'Jivago',
  speciality: 'Psychiatry',
  image_url: 'https://www.stockvault.net/data/2015/09/01/177580/preview16.jpg',
  email: 'jivago@email.com',
  location: 'Moscow',
)

Clair = Doctor.create(
  name: 'Clair Thompson',
  speciality: 'Dentistry',
  image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.publicdomainpictures.net%2Fpictures%2F210000%2Fvelka%2Fdoctor-1490804651WwZ.jpg&f=1&nofb=1&ipt=f44db0ff316de24ca2e1265a2dd823a80098ca49101a985436df19c35d081ad2&ipo=images',
  email: 'jivago@email.com',
  location: 'London',
)

appointments = Appointment.create(appointment_date: '12-12-2022', city: 'Moscow', duration: 1)
appointments = Appointment.create(appointment_date: '22-12-2022', city: 'London', duration: 1)

speciality = Speciality.create(name: 'Dentistry', description: 'Takes care of our teeth', doctor_id: 1)
speciality = Speciality.create(name: 'Psychiatry', description: 'Takes care of our mind', doctor_id: 1)
