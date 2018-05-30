# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Destination.destroy_all
Activity.destroy_all
Guest.destroy_all
Project.destroy_all
User.destroy_all


# USER SEED
Tony = User.create!(first_name: "Antoine", last_name: "Goffette", email:"tony@gmail.com", password: "123456")
Giogio = User.create!(first_name: "Giovanni", last_name: "Rescaglio", email:"giogio@gmail.com", password: "123456")
Lolo = User.create!(first_name: "Laura", last_name: "Martin", email:"lolo@gmail.com", password: "123456")

# PROJECT SEED
P = Project.create!(name: "Remis party", start_date: "01/06/2018", end_date: "31/07/2018", max_budget: 400, user: User.first)

# GUEST SEED
Guest1 = Guest.create!(user: User.first, project: Project.first, budget: 200, role: "admin")
Guest2 = Guest.create!(user: User.second, project: Project.first, budget: 250, role: "participant")
Guest3 = Guest.create!(user: User.third, project: Project.first, budget: 300, role: "participant")

# ACTIVITIES SEED

karting = Activity.create!(name:"karting", category: "day", project: Project.first)
paintball = Activity.create!(name: "paintball", category: "day", project: Project.first)
wine_tasting = Activity.create!(name: "wine tasting", category: "day", project: Project.first)
kayaking = Activity.create!(name: "kayaking", category: "day", project: Project.first)
canyoning = Activity.create!(name: "canyoning", category: "day", project: Project.first)
museum = Activity.create!(name: "museum", category: "day", project: Project.first)
football_match = Activity.create!(name: "football", category: "day", project: Project.first)
restaurant = Activity.create!(name: "five guys", category: "day", project: Project.first)
lasertag = Activity.create!(name: "lasertag", category: "day", project: Project.first)
hiking = Activity.create!(name: "hiking", category: "day", project: Project.first)
clubbing = Activity.create!(name: "clubbing", category: "night", project: Project.first)
whisky = Activity.create!(name: "whisky by fireplace", category: "night", project: Project.first)
strip_club = Activity.create!(name: "strip club", category: "night", project: Project.first)
festival = Activity.create!(name: "festival", category: "night", project: Project.first)


# DESTINATIONS SEED

Ibiza = Destination.create!(name:"Ibiza", project: Project.first)
Rome = Destination.create!(name:"Rome", project: Project.first)
Amsterdam = Destination.create!(name:"Amsterdam", project: Project.first)
London = Destination.create!(name:"London", project: Project.first)
Barcelona = Destination.create!(name:"Barcelona", project: Project.first)
Madrid = Destination.create!(name:"Madrid", project: Project.first)
Lisbon = Destination.create!(name:"Rome", project: Project.first)



