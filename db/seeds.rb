# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airline_1 = Airline.create!(name: 'American')
airline_2 = Airline.create!(name: 'Delta')
airline_3 = Airline.create!(name: 'JetBlue')
airline_4 = Airline.create!(name: 'SouthWest')
airline_5 = Airline.create!(name: 'United')

flight_1 = Flight.create!(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: airline_1.id)
flight_2 = Flight.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline_id: airline_1.id)
flight_3 = Flight.create!(number: "9091", date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: airline_2.id)
flight_4 = Flight.create!(number: "6798", date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline_id: airline_3.id)
flight_5 = Flight.create!(number: "9665", date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline_id: airline_4.id)
flight_6 = Flight.create!(number: "4567", date: "1/16/2022", departure_city: "Boston", arrival_city: "Denver", airline_id: airline_5.id)

passenger_1 = Passenger.create!(name: "Brennan Lee Mulligan", age: 13)
passenger_2 = Passenger.create!(name: "Aabria Iyengar", age: 9)
passenger_3 = Passenger.create!(name: "Bill Seacaster", age: 46)
passenger_4 = Passenger.create!(name: "Misty Moore", age: 44)
passenger_5 = Passenger.create!(name: "Kingston Brown", age: 84)


flight_passenger_1 = FlightPassenger.create!(flight: flight_1, passenger: passenger_1)
flight_passenger_1 = FlightPassenger.create!(flight: flight_2, passenger: passenger_2)
flight_passenger_1 = FlightPassenger.create!(flight: flight_3, passenger: passenger_3)
flight_passenger_1 = FlightPassenger.create!(flight: flight_4, passenger: passenger_4)
flight_passenger_1 = FlightPassenger.create!(flight: flight_5, passenger: passenger_5)