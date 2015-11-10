# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.create!(name: "ryan", email: "r@example.com", password: "password", teacher_id: 3)    #Student ID: 1
Student.create!(name: "doug", email: "d@example.com", password: "password", teacher_id: 3)    #Student ID: 2
Student.create!(name: "mason", email: "m@example.com", password: "mason", teacher_id: 3)      #Student ID: 3
Student.create!(name: "danai", email: "da@example.com", password: "password", teacher_id: 1)  #Student ID: 4

20.times do
  Student.create!(name: Faker::Name.name,
      email: Faker::Internet.free_email,
      password: Faker::Internet.password,
      teacher_id: 1)
end

Teacher.create!(name: "Danai", email: "d@teacher.com", password: "password")  #Teacher ID: 1
Teacher.create!(name: "Mason", email: "m@teacher.com", password: "password")  #Teacher ID: 2
Teacher.create!(name: "John", email: "j@teacher.com", password: "password")   #Teacher ID: 3

Topic.create!(title: "TDD", teacher_id: 1)          #Topic ID: 1
Topic.create!(title: "Metaphysics", teacher_id: 1)  #Topic ID: 2
Topic.create!(title: "Mailers", teacher_id: 3)      #Topic ID: 3

Score.create!(score: 6, student_id: 1, topic_id: 1) #Score ID: 1
Score.create!(score: 4, student_id: 2, topic_id: 3) #Score ID: 2
Score.create!(score: 2, student_id: 3, topic_id: 2) #Score ID: 3
Score.create!(score: 2, student_id: 2, topic_id: 2) #Score ID: 4
