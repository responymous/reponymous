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


Topic.create!(title: "Pre-Work", teacher_id: 1)
Topic.create!(title: "Control Flow", teacher_id: 1)
Topic.create!(title: "Testing", teacher_id: 1)
Topic.create!(title: "Modules", teacher_id: 1)
Topic.create!(title: "HTML and CSS", teacher_id: 1)
Topic.create!(title: "Rails", teacher_id: 1)
Topic.create!(title: "Scaffold", teacher_id: 1)
Topic.create!(title: "JavaScript", teacher_id: 1)
Topic.create!(title: "Efficiency", teacher_id: 1)
Topic.create!(title: "Processing", teacher_id: 1)

Topic.create!(title: "Heroku", teacher_id: 2)
Topic.create!(title: "GitHub", teacher_id: 2)
Topic.create!(title: "Metaphysics", teacher_id: 2)  #Topic ID: 2
Topic.create!(title: "Mailers", teacher_id: 3)      #Topic ID: 3
Topic.create!(title: "jQuery", teacher_id: 3)
Topic.create!(title: "Instance Variables", teacher_id: 3)

counter = Time.now - 9.days

Topic.all.each do |t|
 100.times do |i|
   if t.id % 3 == 0
     score = rand(6)+1
   elsif t.id % 3 == 1
     score = (rand(i)*5.0/100) + 1
   else
     score = (rand((50-i).abs)*5.0/50) + 1
   end
   Score.create!(score: score,
       student: t.teacher.students.sample,
       topic_id: t.id,
       created_at: counter += rand(216)+1)
 end
 counter += 21.hours
end
