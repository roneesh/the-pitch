# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Destroying All..."
User.destroy_all
Employer.destroy_all
Job.destroy_all
Pitch.destroy_all

puts "All Destroyed."

Employers = [
   {name: "Trunkclub", email: "trunk@trunkclub.com", description: "Clothes 4 hackers", password: "1" }
  ]  
  #password_digest: "$2a$10$XXPu0Qpn21FgsXmCM9cDk.Z.RCKtGVmcEzRDc9SA4IElWegUbOBkq"
  
Users = [
  {first_name: "Roneesh", last_name: "Vashisht", email: "roneesh@gmail.com", password: "1"}
  ]
  #password_digest: "$2a$10$CwsLXeVcgZPAT0SYXsLv7eCbyUaQ74YcZm/Znqw8MYcH5kBF1.lg2"

puts "Creating Employers and Users and generating their id's..."
employer1 = Employer.create(Employers[0])
employer1_id = employer1.id 

user1 =  User.create(Users[0])
user1_id = user1.id

Jobs = [
  {title: "Cheif of Procurement", description: "Buying for Trunkclub", employer_id: employer1_id}
  ]
  
job1 = Job.create(Jobs[0])
job1_id = job1.id
  
Pitches = [
  {headline: "I'm awesome", user_id: user1_id, job_id: job1_id}
  ]

Pitch.create(Pitches[0])

puts "Created!"