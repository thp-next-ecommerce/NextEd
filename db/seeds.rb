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

Culture.create(name: "Culture 1")

Domain.create(name: "Domain 1", culture_id: 1)

10.times do |i|
  Skill.create(name: "Compétance #{i}", description: Faker::Lorem.sentence(10), domain_id: 1)
  ++i
end
