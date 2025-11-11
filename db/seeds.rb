# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
Note.destroy_all

notes = [
  { title: 'First Note', description: 'This is my very first note with Hotwire.' },
  { title: 'Meeting Notes', description: 'Discuss project milestones, deadlines, and blockers.' },
  { title: 'Shopping List', description: 'Milk, eggs, bread, coffee, and chocolate 🍫.' },
  { title: 'Ideas', description: 'Build a personal blog with Rails 7 + Hotwire.' },
  { title: 'Reminder', description: 'Don’t forget to write the thesis conclusion by next week.' }
]

notes.each do |note|
  Note.create!(note)
end

puts "✅ Seeded #{Note.count} notes"
