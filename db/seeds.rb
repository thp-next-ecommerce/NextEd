# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

Culture.destroy_all
Domain.destroy_all
Skill.destroy_all
WorkSession.destroy_all
Section.destroy_all
Group.destroy_all
Student.destroy_all

Culture.create!(name: "Culture 1")
Culture.create!(name: "Culture 2")
Culture.create!(name: "Culture 3")

Domain.create!(name: "Domain 1", culture_id: Culture.first.id)
Domain.create!(name: "Domain 2", culture_id: Culture.first.id)
Domain.create!(name: "Domain 3", culture_id: Culture.last.id)

10.times do |i|
  Skill.create!(
    name: "Compétence #{i}",
    description: Faker::Lorem.sentence(10),
    domain: Domain.first
  )
  ++i
end
puts "created 10 Skills"

10.times do
  schedule = %w(M1 M2 M3 M4 S1 S2 S3 S4)
  skills = []
  5.times do skills.push(Skill.all.sample) end
  WorkSession.create!(
    date: Faker::Date.between(1.year.ago, 1.year.from_now),
    daily_schedule: schedule.sample,
    skills: skills
  )
end
puts "created 10 WorkSessions"

20.times do
  Section.create!(
    year: 2019,
    level: [6, 5, 4, 3].sample,
    sub_section: %w(A B C D E F G).sample
  )
end
puts "Created 20 sections"

10.times do
  Group.create!(
    name: Faker::Company.name,
    level: [6, 5, 4, 3].sample
  )
end
puts "created 10 groups"

700.times do |i|
  sections = []
  groups = []
  rand(1..4).times{
    sections << Section.all.sample
    groups << Group.all.sample
  }
  Student.create!(
    first_name: "First_name#{i}",
    last_name: "Student#{i}",
    sections: sections
  )
end
puts "created 700 Students"
