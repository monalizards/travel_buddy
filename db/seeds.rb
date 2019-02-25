require 'faker'

# User
# user.username = Faker::Internet.username(5..15)
# user.email = Faker::Internet.email(user.username)
# user.password = Faker::Internet.password(8)
# user.save

50.times do |time|
  user = User.new
  user.username = Faker::Internet.username(5..15)
  user.email = Faker::Internet.email(user.username)
  user.password = Faker::Internet.password(8)
  user.description = "HI, I am #{user.username}. The coolest person on earth"
  user.save
  if time < 20
    trip = Trip.new
    trip.organizer = user
    trip.destination = Faker::Address.country
    trip.start_date = Faker::Date.between(Date.today, 1.year.from_now)
    trip.end_date = trip.start_date + rand(1..30).days
    trip.budget = rand(3000).round(-2)
    trip.title = "#{%w[Historical Cultural Cycling Winetasting Foodies Sailing Diving].sample.capitalize} trip in #{trip.destination}"
    trip.description = "#{trip.title}\nIt's going to be #{%w[Epic Wonderful Crazy Fun Exciting Amazing Cool].sample.upcase}!"
    trip.max_participants = rand(1..5)
    trip.save
  elsif time < 40
    participation = Participation.new
    participation.user = user
    participation.trip = Trip.all.sample
    participation.save
  end
end

# Trip

# trip = Trip.new
# trip.organizer = user
# trip.destination = Faker::Address.country
# trip.start_date =
# trip.end_date = trip.start_date +
# trip.budget =
# trip.title =
# trip.description =
# trip.max_participants =

# # Participation
# participation = Participation.new
# participation.user = user
# participation.trip = Trip.all[0..-1].sample
