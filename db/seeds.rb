# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActsAsVotable::Vote.destroy_all
Destination.destroy_all
Activity.destroy_all
Mood.destroy_all
Guest.destroy_all
Project.destroy_all
User.destroy_all


# USER SEED
Antoine = User.create!(first_name: "Antoine", email:"antoine@harry.team", password: "123456", remote_picture_url: "https://avatars3.githubusercontent.com/u/36988410?s=460&v=4")
puts "antoine generated"
Julien = User.create!(first_name: "Julien", email:"julien@harry.team", password: "123456", remote_picture_url: "https://avatars3.githubusercontent.com/u/11377783?s=400&v=4")
Kevin = User.create!(first_name: "Kevin", email:"kevin@harry.team", password: "123456", remote_picture_url: "https://avatars1.githubusercontent.com/u/9978111?s=460&v=4")
Remi = User.create!(first_name: "Remi", email:"remi@harry.team", password: "123456", remote_picture_url: "https://avatars1.githubusercontent.com/u/15021685?s=400&v=4")
Edouard = User.create!(first_name: "Edouard", email:"edouard@harry.team", password: "123456", remote_picture_url: "https://pbs.twimg.com/profile_images/930027222584430593/MF_t4pBU_400x400.jpg")
Giovanni = User.create!(first_name: "Giovanni", email:"giovanni@harry.team", password: "123456", remote_picture_url: "https://image.flaticon.com/icons/png/512/147/147140.png")
puts "user generated"
# PROJECT SEED

P = Project.create!(name: "Pierre's Bachelor Party", start_date: "11/06/2018", end_date: "15/07/2018", max_budget: 450, user: User.first)
puts "project generated"

10.times do
Project.create!(name:"other",user: User.second)
end
puts "fake projects generated"

#WEEKEND SEED
WeekEnd.create(project: Project.first, start_date: "15/06/2018", end_date: "17/06/2018")
winner = WeekEnd.create(project: Project.first, start_date: "22/06/2018", end_date: "24/06/2018")
WeekEnd.create(project: Project.first, start_date: "29/06/2018", end_date: "01/07/2018")
WeekEnd.create(project: Project.first, start_date: "06/07/2018", end_date: "08/07/2018")
WeekEnd.create(project: Project.first, start_date: "13/07/2018", end_date: "15/07/2018")
puts "fake projects generated"

# GUEST SEED
AntoineGuest = Guest.create!(user: User.first, project: Project.first, budget: 400, role: "admin")
JulienGuest = Guest.create!(user: User.second, project: Project.first, budget: 350, role: "participant")
KevinGuest = Guest.create!(user: User.third, project: Project.first, budget: 375, role: "participant")
BorisGuest = Guest.create!(user: User.fourth, project: Project.first, budget: 375, role: "participant")
EdouardGuest = Guest.create!(user: User.fifth, project: Project.first, budget: 375, role: "participant")
GiovanniGuest = Guest.create!(user: User.last, project: Project.first, role: "participant")

puts "guest generated"
# ACTIVITIES SEED

Hiking = Activity.create!(name: "Hiking", category: "day", project: Project.first)
GR_20 = Activity.create!(name: "GR 20", category: "day", project: Project.first)
Cooking_Class = Activity.create!(name: "Cooking Class", category: "day", project: Project.first)
Rafting = Activity.create!(name: "Rafting", category: "day", project: Project.first)
Paddle = Activity.create!(name: "Paddle", category: "day", project: Project.first)
Party_Vianotte = Activity.create!(name: "Party@ViaNotte", category: "night", project: Project.first)
Berghain = Activity.create!(name: "Berghain Club", category: "night", project: Project.first)
BBQ = Activity.create!(name: "Barbecue Party", category: "night", project: Project.first)
Macumba = Activity.create!(name: "Macumba Club", category: "night", project: Project.first)
House_Dinner = Activity.create!(name: "House Dinner", category: "night", project: Project.first)
puts "activity generated"

# DESTINATIONS SEED

Mont_Blanc = Destination.create!(name:"Mont Blanc", project: Project.first)
Corsica = Destination.create!(name:"Corsica", project: Project.first)
Berlin = Destination.create!(name:"Berlin", project: Project.first)
Gorges_du_Verdon = Destination.create!(name:"Gorges du Verdon", project: Project.first)
Le_Touquet = Destination.create!(name:"Le Touquet", project: Project.first)
puts "destination generated"


#VOTES SEED
#ANTOINE
Activity.first.vote_by :voter => User.first
Activity.second.vote_by :voter => User.first
Activity.fourth.vote_by :voter => User.first
Activity.find_by_name("Party@ViaNotte").vote_by :voter => User.first
Activity.find_by_name("Barbecue Party").vote_by :voter => User.first
Destination.first.vote_by :voter => User.first
Destination.second.vote_by :voter => User.first
Destination.fourth.vote_by :voter => User.first
puts "Antoine votes generated"

#JULIEN
Activity.third.vote_by :voter => User.second
Activity.find_by_name("Paddle").vote_by :voter => User.second
Activity.find_by_name("Party@ViaNotte").vote_by :voter => User.second
Activity.find_by_name("Berghain Club").vote_by :voter => User.second
Activity.find_by_name("Macumba Club").vote_by :voter => User.second
Destination.second.vote_by :voter => User.second
Destination.third.vote_by :voter => User.second
Destination.last.vote_by :voter => User.second
puts "Julien votes generated"

#KEVIN
Activity.find_by_name("Hiking").vote_by :voter => User.third
Activity.find_by_name("GR 20").vote_by :voter => User.third
Activity.find_by_name("Rafting").vote_by :voter => User.third
Activity.find_by_name("Party@ViaNotte").vote_by :voter => User.third
Destination.second.vote_by :voter => User.third
Destination.fourth.vote_by :voter => User.third
puts "Kevin votes generated"


#BORIS
Activity.find_by_name("Hiking").vote_by :voter => User.fourth
Activity.find_by_name("GR 20").vote_by :voter => User.fourth
Activity.find_by_name("Rafting").vote_by :voter => User.fourth
Activity.find_by_name("Party@ViaNotte").vote_by :voter => User.fourth
Activity.find_by_name("House Dinner").vote_by :voter => User.fourth
Destination.second.vote_by :voter => User.fourth
Destination.fourth.vote_by :voter => User.fourth
puts "Boris votes generated"

#EDOUARD
Activity.find_by_name("Hiking").vote_by :voter => User.fifth
Activity.find_by_name("Rafting").vote_by :voter => User.fifth
Activity.find_by_name("Party@ViaNotte").vote_by :voter => User.fifth
Activity.find_by_name("Macumba Club").vote_by :voter => User.fifth
Activity.find_by_name("House Dinner").vote_by :voter => User.fifth
Destination.second.vote_by :voter => User.fifth
Destination.last.vote_by :voter => User.fifth
puts "Edouard votes generated"

#MOODS
#ANTOINE
Mood.create(user:User.first, project:Project.first, wild:true, trashy:true, chilling:true)
puts "antoine moods generated"
#JULIEN
Mood.create(user:User.second, project:Project.first, city:true, fancy:true, clubbing:true)
puts "julien moods generated"
#KEVIN
Mood.create(user:User.third, project:Project.first, wild:true, trashy:true, clubbing:true)
puts "kevin moods generated"
#BORIS
Mood.create(user:User.fourth, project:Project.first, wild:true, trashy:true, clubbing:true)
puts "Boris moods generated"
#EDOUARD
Mood.create(user:User.fifth, project:Project.first, wild:true, fancy:true, chilling:true)
puts "Boris moods generated"


#WEEKENDS
winner.vote_by :voter => User.first
winner.vote_by :voter => User.second
winner.vote_by :voter => User.third
winner.vote_by :voter => User.fourth
winner.vote_by :voter => User.fifth
puts "weekend votes generated"
