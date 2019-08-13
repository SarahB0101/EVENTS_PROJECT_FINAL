require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

email = "sarah.bouchir@yopmail.com"
description = "Salut :)Salut :)Salut :)Salut :)Salut :) Salut :)"
first_name = "Sarag"
last_name = "Bouchir"
password = "bonjour" #password très safe, je recommande vivement
User.create(email:email, description:description, first_name:first_name, last_name:last_name, password: password, password_confirmation: password)



7.times do
	user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, description: Faker::TvShows::Friends.quote, password: 'bonjour', password_confirmation: 'bonjour')
end


5.times do
	start_date = Faker::Time.forward(days: 80)
	duration = rand(12)*60
	title = Faker::TvShows::BreakingBad.episode
	price = rand(1..1000)
	location = Faker::Address.city
	admin = User.all.sample
	Event.create(start_date:start_date, duration:duration, title:title, description:description, price:price, location:location, admin:admin)

	#Event.create(title: Faker::TvShows::BreakingBad.episode, description: Faker::TvShows::Friends.quote, start_date: Faker::Date.forward(days: 23), duration: rand(60..500), price: rand(1..1000), location: Faker::Address.city, admin: User.all.sample)
end


5.times do
	stripe_customer_id = ""
	participant = User.all.sample
	event = Event.all.sample
	Attendance.create(stripe_customer_id: stripe_customer_id, participant: participant, event: event)
end



