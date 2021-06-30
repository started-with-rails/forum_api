# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: 'example', email: 'example@mail.com' , password: '12345678' , password_confirmation: '12345678')

10.times do
	title = (0...8).map { (65 + rand(26)).chr }.join
	Category.create!(title: title, status: true ) 
end
500.times do 
	text  = 50.times.map { (0...(rand(10))).map { ('a'..'z').to_a[rand(26)] }.join }.join(" ")
	q = Question.create!(title: text.truncate(30), description: text, status: true, user: User.last, category: Category.order("RANDOM()").last)
	list = ["awesome","slick","great","marvel","wonder"]
	q.tag_list = list.sample(3).join(", ")
	q.save!
end

1000.times do 
	text  = 50.times.map { (0...(rand(10))).map { ('a'..'z').to_a[rand(26)] }.join }.join(" ")
	Answer.create!(user: User.last, question: Question.order("RANDOM()").last, status: true, answer: text)
end