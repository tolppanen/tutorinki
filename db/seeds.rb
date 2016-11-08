# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
   User.create!(:email => Faker::Internet.email, :first_name => Faker::Name.first_name, :last_name => Faker::Name.last_name,
   :password => Faker::Internet.password, :teacher => true)
end

Subject.create!(name:"Ohjelmointi", detail:"Scala")
Subject.create!(name:"Ohjelmointi", detail:"Java")
Subject.create!(name:"Ohjelmointi", detail:"Rails")
Subject.create!(name:"Ohjelmointi", detail:"Clojure")
Subject.create!(name:"Matematiikka", detail:"Ylä-aste")
Subject.create!(name:"Matematiikka", detail:"Lukio")
Subject.create!(name:"Fysiikka", detail:"Lukio")
Subject.create!(name:"Oikeustiede", detail:"Pääsykoe")

User.all.each do |u|
  u.skills << Skill.create!(:subject => Subject.all.sample, :description => Faker::StarWars.quote)
  u.skills << Skill.create!(:subject => Subject.all.sample, :description => Faker::StarWars.quote)
end
