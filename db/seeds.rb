# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
puts "lancement du seed"
Culture.destroy_all
Domain.destroy_all
Skill.destroy_all
WorkSession.destroy_all
Slot.destroy_all
Section.destroy_all
Group.destroy_all
Student.destroy_all
ScholarYear.destroy_all
Teacher.destroy_all
Subject.destroy_all
puts "fin du destroy all"

culture1 = Culture.create!(name: "Les langages pour penser et communiquer", description: "Comprendre et s'exprimer")
culture2 = Culture.create!(name: "Les méthodes et outils pour apprendre", description: "Apprendre à apprendre, seuls ou collectivement, en classe ou en dehors")
culture3 = Culture.create!(name: "La formation de la personne et du citoyen", description: "Transmettre les valeurs fondamentales et les principes inscrits dans la Constitution")
culture4 = Culture.create!(name: "Les systèmes naturels et les systèmes techniques", description: "Donner à l'élève les fondements de la culture mathématique, scientifique et technologique")
culture5 = Culture.create!(name: "Les représentations du monde et de l'activité humaine", description: "Développer une conscience de l'espace géographique et du temps historique")

puts "Created 5 Cultures"

Domain.create!(name: "langue française", description: Faker::Lorem.sentence(10), culture_id: culture1.id)
Domain.create!(name: "langues vivantes étrangères ou régionales", description: Faker::Lorem.sentence(10), culture_id: culture1.id)
Domain.create!(name: "langages mathématiques, scientifiques et informatiques", description: Faker::Lorem.sentence(10), culture_id: culture1.id)
Domain.create!(name: "langages des arts et du corps", description: Faker::Lorem.sentence(10), culture_id: culture1.id)

Domain.create!(name: "accès à l'information et à la documentation", description: Faker::Lorem.sentence(10), culture_id: culture2.id)
Domain.create!(name: "outils numériques", description: Faker::Lorem.sentence(10), culture_id: culture2.id)
Domain.create!(name: "conduite de projets individuels et collectifs", description: Faker::Lorem.sentence(10), culture_id: culture2.id)
Domain.create!(name: "organisation des apprentissages", description: Faker::Lorem.sentence(10), culture_id: culture2.id)

Domain.create!(name: "apprentissage de la vie en société, de l'action collective et de la citoyenneté", description: Faker::Lorem.sentence(10), culture_id: culture3.id)
Domain.create!(name: "formation morale et civique", description: Faker::Lorem.sentence(10), culture_id: culture3.id)
Domain.create!(name: "respect des choix personnels et des responsabilités individuelles", description: Faker::Lorem.sentence(10), culture_id: culture3.id)

Domain.create!(name: "approche scientifique et technique de la Terre et de l'univers", description: Faker::Lorem.sentence(10), culture_id: culture4.id)
Domain.create!(name: "curiosité et sens de l'observation", description: Faker::Lorem.sentence(10), culture_id: culture4.id)
Domain.create!(name: "capacité à résoudre des problèmes", description: Faker::Lorem.sentence(10), culture_id: culture4.id)

Domain.create!(name: "compréhension des sociétés dans le temps et dans l'espace", description: Faker::Lorem.sentence(10), culture_id: culture5.id)
Domain.create!(name: "interprétation des productions culturelles humaines", description: Faker::Lorem.sentence(10), culture_id: culture5.id)
Domain.create!(name: "connaissance du monde social contemporain", description: Faker::Lorem.sentence(10), culture_id: culture5.id)

puts "Created 17 Domains"

ScholarYear.create(start_date: Date.new(2018, 9, 4), end_date: Date.new(2019, 0o7, 14), current: true)
puts "Created ScholarYear"

20.times do |i|
  Skill.create!(
    name: "Compétence #{i}",
    description: Faker::Lorem.sentence(10),
    domain: Domain.all.sample
  )
  ++i
end
puts "Created 20 Skills"

5.times do |i|
  Subject.create!(
    name: "Matière #{i}",
    description: Faker::Lorem.sentence(10)
  )
  ++i
end
puts "Created 5 Subjects"

7.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end
puts "Created 7 Teachers"

schedule = %w(M1 M2 M3 M4 S1 S2 S3 S4)
schedule.each_with_index do |slot, index|
  t = Time.zone.parse("08:30") + (index * (60 * 60))
  Slot.create!(
    name: slot,
    start_time: t,
    end_time: t + (60 * 55)
  )
end
puts "Created 8 Slots"

46.times do
  skills = []
  5.times do skills.push(Skill.all.sample) end
  teachers = []
  2.times do teachers.push(Teacher.all.sample) end
  subjects = []
  2.times do subjects.push(Subject.all.sample) end
  WorkSession.create!(
    date: Faker::Date.between(1.year.ago, 1.year.from_now),
    slot: Slot.all.sample,
    skills: skills,
    scholar_year: ScholarYear.first,
    teachers: teachers,
    subjects: subjects
  )
end
puts "Created 46 WorkSessions"

20.times do
  Section.create!(
    year_start: 2018,
    year_end: 2019,
    level: [6, 5, 4, 3].sample,
    sub_section: %w(A B C D E F G).sample,
    scholar_year: ScholarYear.first
  )
end
puts "Created 20 sections"

10.times do
  Group.create!(
    name: Faker::Company.name,
    scholar_year: ScholarYear.first
  )
end
puts "Created 10 Groups"

700.times do |_i|
  sections = []
  groups = []
  work_sessions = []
  rand(1..2).times{
    sections << Section.all.sample
    groups << Group.all.sample
    work_sessions << WorkSession.all.sample
  }
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    sections: sections,
    groups: groups,
    work_sessions: work_sessions
  )
end
puts "Created 700 Students"
