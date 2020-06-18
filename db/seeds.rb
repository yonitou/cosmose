# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

Project.destroy_all
User.destroy_all

i = 1

puts 'Creating 5 users...'


adresses = %w(Marseille Paris Toulouse Nantes Lyon Dijon Bordeaux Rennes Brest Nice Avignon)




5.times do
  user = User.new(
    email: "email#{i}@cosmose.art",
    password: "azerty",
    username: Faker::Internet.username(specifier: 4..8),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Geocoder.search(adresses.sample).first.data['address']['city'],
    competences: User::SKILLS_LIST.sample(3)
  )
  img = open('https://source.unsplash.com/800x800/?portrait,avatar')
  user.photo.attach(io: img, filename: "avatar-#{user.username}.jpg")
  user.save
  user_block_img = open('https://source.unsplash.com/random/800x600')
  user_block = Block.new
  user_block.upload.attach(io: user_block_img, filename: "#{User.last.username}.jpg")
  user_block.user = User.last
  user_block.content = ""
  user_block.save
  i += 1
end

puts 'and a few projects...'

12.times do 
  project = Project.new(
    title: Faker::Book.title,
    description: Faker::Quote.matz.first(100),
    categories: Project::CATEGORIES_LIST.sample(2),
    address: Geocoder.search(adresses.sample).first.data['address']['city']
  )
  project.user = User.all.sample
  project.save
  project_img = open('https://source.unsplash.com/1200x800/?art')
  first_block = Block.new
  first_block.upload.attach(io: project_img, filename: 'first_block.jpg')
  first_block.user = Project.last.user
  first_block.project_id = Project.last.id
  first_block.content = ""
  first_block.save
end

puts 'Done!!'