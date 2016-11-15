# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


laura = User.create!(:email => "laura@lehtori.com", :first_name => "Laura", :last_name => "Lehtori", :password => "salasana", :teacher => true)
teemu = User.create!(:email => "teemu@tuutori.com", :first_name => "Teemu", :last_name => "Tuutori", :password => "salasana", :teacher => true)
aatu = User.create!(:email =>  "aatu@auttavainen.com", :first_name => "Aatu", :last_name => "Auttavainen", :password => "salasana", :teacher => true)

hanna = User.create!(:email =>  "hanna@hakija.com", :first_name => "Hanna", :last_name => "Hakija", :password => "salasana", :teacher => false)
onni = User.create!(:email =>  "onni@oppija.com", :first_name => "Onni", :last_name => "Oppija", :password => "salasana", :teacher => false)
katariina = User.create!(:email =>  "katariina@kiinnostunut.com", :first_name => "Katariina", :last_name => "Kiinnostunut", :password => "salasana", :teacher => false)




laura.skills << Skill.create!(:subject => Subject.find_or_create_by!(name:"ohjelmointi", detail:"scala"), :description => Faker::StarWars.quote)
laura.skills << Skill.create!(:subject => Subject.find_or_create_by!(name:"ohjelmointi", detail:"java"), :description => Faker::StarWars.quote)
laura.skills << Skill.create!(:subject => Subject.find_or_create_by!(name:"ohjelmointi", detail:"ruby"), :description => Faker::StarWars.quote)
laura.skills << Skill.create!(:subject => Subject.find_or_create_by!(name:"ohjelmointi", detail:"clojure"), :description => Faker::StarWars.quote)
laura.skills << Skill.create!(:subject => Subject.find_or_create_by!(name:"matematiikka", detail:"lukio"), :description => Faker::StarWars.quote)

teemu.skills << Skill.create!(:subject => Subject.find_or_create_by!(name:"matematiikka", detail:"ylä-aste"), :description => Faker::StarWars.quote)
teemu.skills << Skill.create!(:subject => Subject.find_or_create_by!(name:"matematiikka", detail:"lukio"), :description => Faker::StarWars.quote)
teemu.skills << Skill.create!(:subject => Subject.find_or_create_by!(name:"oikeustiede", detail:"pääsykoe"), :description => Faker::StarWars.quote)

aatu.skills << Skill.create!(:subject => Subject.find_or_create_by!(name:"englanti", detail:"lukio"), :description => Faker::StarWars.quote)
aatu.skills << Skill.create!(:subject => Subject.find_or_create_by!(name:"fysiikka", detail:"lukio"), :description => Faker::StarWars.quote)
aatu.skills << Skill.create!(:subject => Subject.find_or_create_by!(name:"lääketiede", detail:"pääsykoe"), :description => Faker::StarWars.quote)

hanna.friend_request(laura)
laura.accept_request(hanna)

onni.friend_request(teemu)
teemu.accept_request(onni)

katariina.friend_request(aatu)
aatu.accept_request(katariina)
