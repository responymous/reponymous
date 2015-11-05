# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.create!(name: "ryan", email: "r@example.com", password: "password", score: 3, teacher_id: 1)
Student.create!(name: "doug", email: "d@example.com", password: "password", score: 4, teacher_id: 1)
Student.create!(name: "mason", email: "m@example.com", password: "mason", score: 2, teacher_id: 1)
Student.create!(name: "danai", email: "da@example.com", password: "password",  score: 1, teacher_id: 1)

20.times do
  Student.create!(name: Faker::Name.name,
      email: Faker::Internet.free_email,
      password: Faker::Internet.password,
      score: Faker::Number.between(1, 6),
      teacher_id: 1)
end

Teacher.create!(name: "dana", email: "d@teacher.com", password: "password")
