# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Teacher.create!(name: "Mason", email: "mason@teacher.com", password: "password")  #Teacher ID: 1
Teacher.create!(name: "Danai", email: "danai@teacher.com", password: "password")  #Teacher ID: 2
Teacher.create!(name: "John", email: "john@teacher.com", password: "password")   #Teacher ID: 3

Student.create!(name: "Ryan Graham", email: "ryan@example.com", password: "password", teacher_id: 1)
Student.create!(name: "Doug Bryant", email: "doug@example.com", password: "password", teacher_id: 1)
Student.create!(name: "Patrick Swayze", email: "swayze@example.com", password: "password", teacher_id: 1)
Student.create!(name: "Tyler", email: "tyler@example.com", password: "password", teacher_id: 2)
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


Topic.create!(title: "Ruby", teacher_id: 1)
Topic.create!(title: "Git", teacher_id: 1)
Topic.create!(title: "Object Design", teacher_id: 1)
Topic.create!(title: "Testing", teacher_id: 1)
Topic.create!(title: "Databases", teacher_id: 1)
Topic.create!(title: "APIs", teacher_id: 1)
Topic.create!(title: "HTML and CSS", teacher_id: 1)
Topic.create!(title: "Rails", teacher_id: 1)
Topic.create!(title: "JavaScript", teacher_id: 1)
Topic.create!(title: "Security", teacher_id: 1)

Topic.create!(title: "Heroku", teacher_id: 2)
Topic.create!(title: "GitHub", teacher_id: 2)
Topic.create!(title: "Metaphysics", teacher_id: 2)
Topic.create!(title: "Mailers", teacher_id: 3)
Topic.create!(title: "jQuery", teacher_id: 3)
Topic.create!(title: "Instance Variables", teacher_id: 3)

counter = Time.now - 9.days

Topic.all.each do |t|
 100.times do |i|
   if t.id % 3 == 0
     score = rand(6)+1
   elsif t.id % 3 == 1
     score = 1.5 + (i.to_f/100)*4 + (rand-0.5)
   else
     score = 1.5 + ((50-i).abs.to_f/50)*4 + (rand-0.5)
   end
   Score.create!(score: score,
       student: t.teacher.students.sample,
       topic_id: t.id,
       created_at: counter += rand(216)+1)
 end
 counter += 21.hours
end
