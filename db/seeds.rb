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
Lesson.destroy_all

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

10.times do
  schedule = %w(M1 M2 M3 M4 S1 S2 S3 S4)
  skills = []
  5.times do skills.push(Skill.all.sample) end
  Lesson.create!(
    date: Faker::Date.between(1.year.ago, 1.year.from_now),
    daily_schedule: schedule.sample,
    skills: skills
  )
end
