# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teacher.create!(name: "Danai", email: "d@teacher.com", password: "password")  #Teacher ID: 1
Teacher.create!(name: "Mason", email: "m@teacher.com", password: "password")  #Teacher ID: 2
Teacher.create!(name: "John", email: "j@teacher.com", password: "password")   #Teacher ID: 3

Student.create!(name: "Ryan", email: "ryan@example.com", password: "password", teacher_id: 1)    #Student ID: 1
Student.create!(name: "Doug", email: "doug@example.com", password: "password", teacher_id: 1)    #Student ID: 2
Student.create!(name: "Blake", email: "blake@example.com", password: "password", teacher_id: 1)      #Student ID: 3
Student.create!(name: "Tyler", email: "tyler@example.com", password: "password", teacher_id: 2)  #Student ID: 4
Student.create!(name: "Josh", email: "josh@example.com", password: "password", teacher_id: 2)
Student.create!(name: "Julie", email: "julie@example.com", password: "password", teacher_id: 2)
Student.create!(name: "Ruti", email: "ruti@example.com", password: "password", teacher_id: 3)
Student.create!(name: "Will", email: "will@example.com", password: "password", teacher_id: 3)
Student.create!(name: "David", email: "david@example.com", password: "password", teacher_id: 3)

20.times do
  Student.create!(name: Faker::Name.name,
      email: Faker::Internet.free_email,
      password: Faker::Internet.password,
      teacher_id: 1)
end


Topic.create!(title: "TDD", teacher_id: 1)
Topic.create!(title: "AJAX", teacher_id: 1)
Topic.create!(title: "Javascript", teacher_id: 1)
Topic.create!(title: "Heroku", teacher_id: 2)
Topic.create!(title: "GitHub", teacher_id: 2)
Topic.create!(title: "Metaphysics", teacher_id: 2)  #Topic ID: 2
Topic.create!(title: "Mailers", teacher_id: 3)      #Topic ID: 3
Topic.create!(title: "jQuery", teacher_id: 3)
Topic.create!(title: "Instance Variables", teacher_id: 3)

# Teacher 1 with students(1-3) scores for Topic 1:
Score.create!(score: 6, student_id: 1, topic_id: 1)
Score.create!(score: 4, student_id: 2, topic_id: 1)
Score.create!(score: 4, student_id: 3, topic_id: 1)

# Teacher 1 with students(1-3) scores for Topic 2:
Score.create!(score: 4, student_id: 1, topic_id: 2)
Score.create!(score: 2, student_id: 2, topic_id: 2)
Score.create!(score: 3, student_id: 3, topic_id: 2)

# Teacher 1 with students(1-3) scores for Topic 3:
Score.create!(score: 4, student_id: 1, topic_id: 3)
Score.create!(score: 6, student_id: 2, topic_id: 3)
Score.create!(score: 6, student_id: 3, topic_id: 3)

# Teacher 2 with students(4-6) scores for Topic 4:
Score.create!(score: 1, student_id: 4, topic_id: 4)
Score.create!(score: 6, student_id: 5, topic_id: 4)
Score.create!(score: 6, student_id: 6, topic_id: 4)

# Teacher 2 with students(4-6) scores for Topic 5:
Score.create!(score: 1, student_id: 4, topic_id: 5)
Score.create!(score: 3, student_id: 5, topic_id: 5)
Score.create!(score: 6, student_id: 6, topic_id: 5)

# Teacher 2 with students(4-6) scores for Topic 6:
Score.create!(score: 1, student_id: 4, topic_id: 6)
Score.create!(score: 2, student_id: 5, topic_id: 6)
Score.create!(score: 1, student_id: 6, topic_id: 6)

# Teacher 3 with students(7-9) scores for Topic 7:
Score.create!(score: 4, student_id: 7, topic_id: 7)
Score.create!(score: 4, student_id: 8, topic_id: 7)
Score.create!(score: 1, student_id: 9, topic_id: 7)

# Teacher 3 with students(7-9) scores for Topic 8:
Score.create!(score: 4, student_id: 7, topic_id: 8)
Score.create!(score: 4, student_id: 8, topic_id: 8)
Score.create!(score: 4, student_id: 9, topic_id: 8)

# Teacher 3 with students(7-9) scores for Topic 3:
Score.create!(score: 5, student_id: 7, topic_id: 9)
Score.create!(score: 4, student_id: 8, topic_id: 9)
Score.create!(score: 3, student_id: 9, topic_id: 9)
