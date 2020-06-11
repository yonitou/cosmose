# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Project.destroy_all
User.destroy_all

i = 0

puts 'Creating 5 users...'


5.times do
  user = User.new(
    email: "email#{i}@cosmose.art",
    password: "azerty",
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Name.initials,
    competences: User::SKILLS_LIST.sample(3)
  )
  user.save
  i += 1
end

puts 'and a few projects...'

12.times do 
  project = Project.new(
    title: Faker::Space.nebula,
    description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
    categories: Project::CATEGORIES_LIST.sample(2),
    address: Faker::Name.initials
  )
  project.user = User.all.sample
  project.save
end

puts 'Done!'