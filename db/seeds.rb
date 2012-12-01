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

employers = [
   {name: "Trunkclub", email: "trunk@trunkclub.com", description: "Clothes 4 hackers", password: "1" },
   {name: "RubyMercs", email: "rubymercs@example.com", description: "Rubyist for hire", password: "1" },
   {name: "A-Hoy", email: "ahoy@example.com", description: "Pirates, maybe?", password: "1" },
   {name: "Wind Energy", email: "windenergy@example.com", description: "No more gas!", password: "1" }
  ]  

users = [
  {first_name: "Roneesh", last_name: "Vashisht", email: "roneesh@gmail.com", password: "1", password_confirmation: "1"},
  {first_name: "Joe", last_name: "Ngo", email: "joengo83@gmail.com", password: "1", password_confirmation: "1"},
  {first_name: "Brett", last_name: "Hoyer", email: "jbh5079@gmail.com", password: "1", password_confirmation: "1"},
  {first_name: "Kate", last_name: "Houlihan", email: "k8hoolihan@gmail.com", password: "1", password_confirmation: "1"}
  ]

puts "Creating Users..."
User.create users
puts "Created...."


jobs = [
  {title: "Cheif of Procurement", description: "Buying for Trunkclub", :employer => "Trunkclub"},
  {title: "Head Coach", description: "Manage Kobe's Ego", :employer => "RubyMercs"},
  {title: "Artist", description: "You tell me!", :employer => "A-Hoy"},
  {title: "Chief of Wind", description: "Doing dope energy things", :employer => "Wind Energy"}
  ]
  
# job1 = Job.create(Jobs[0])
# job1_id = job1.id
  
pitches = [
  {headline: "I'm awesome", :email => "roneesh@gmail.com"},
  {headline: "I'm just ok", :email => "joengo83@gmail.com"},
  {headline: "I'm not so great", :email => "jbh5079@gmail.com"},
  {headline: "I'm overrated", :email => "k8hoolihan@gmail.com"}
  ]





# jobs.each do |job|
#   e = Employer.find_by_name(job[:employer])
#   Job.create :title => job[:title], :description => job[:description], :employer_id => e.id
# end

pitches.each do |pitch|
  # j = Job.find_by_title(pitch[:title])
  u = User.find_by_email(pitch[:email])
  Pitch.create :headline => pitch[:headline], :user_id => u.id
end

puts "Created!"



