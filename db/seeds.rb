require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all


user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'salutsarahb@yopmail.com', description: Faker::TvShows::Friends.quote, password: 'bonjour', password_confirmation: 'bonjour')


3.times do
	user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, description: Faker::TvShows::Friends.quote, password: 'bonjour', password_confirmation: 'bonjour')
end

5.times do
	event = Event.create(title: Faker::TvShows::BreakingBad.episode, description: Faker::TvShows::Friends.quote, start_date: Faker::Date.forward(days: 23), duration: rand(60..500), price: rand(1..1000), location: Faker::Address.city, admin: User.all.sample)
	participant = User.all.sample
	stripe_customer_id = ""
	Attendance.create(stripe_customer_id: stripe_customer_id, participant: participant, event: Event.all.sample)
end

