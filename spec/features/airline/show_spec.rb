require 'rails_helper'

RSpec.describe 'Airline show page' do
  it 'see a list of passengers that have flights on that airline' do 
    airline_1 = Airline.create!(name: 'American')
    airline_2 = Airline.create!(name: 'Delta')
    
    #flights on airline 1
    flight_1 = Flight.create!(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: airline_1.id)
    flight_2 = Flight.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline_id: airline_1.id)
    flight_3 = Flight.create!(number: "9091", date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: airline_1.id)

    #flights on airline 2
    flight_4 = Flight.create!(number: "6798", date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline_id: airline_2.id)
    flight_5 = Flight.create!(number: "9665", date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline_id: airline_2.id)
    
    passenger_1 = Passenger.create!(name: "Brennan Lee Mulligan", age: 69)
    passenger_2 = Passenger.create!(name: "Aabria Iyengar", age: 8359)
    passenger_3 = Passenger.create!(name: "Bill Seacaster", age: 46)

    passenger_4 = Passenger.create!(name: "Misty Moore", age: 44)
    passenger_5 = Passenger.create!(name: "Kingston Brown", age: 84)
    
    flight_passenger_1 = FlightPassenger.create!(flight: flight_1, passenger: passenger_1)
    flight_passenger_2 = FlightPassenger.create!(flight: flight_2, passenger: passenger_2)
    flight_passenger_3 = FlightPassenger.create!(flight: flight_3, passenger: passenger_3)

    flight_passenger_4 = FlightPassenger.create!(flight: flight_4, passenger: passenger_4)
    flight_passenger_5 = FlightPassenger.create!(flight: flight_5, passenger: passenger_5)

    visit "/airlines/#{airline_1.id}"

    expect(page).to have_content("Brennan Lee Mulligan")
    expect(page).to have_content("Aabria Iyengar")
    expect(page).to have_content("Bill Seacaster")
    
    expect(page).to_not have_content("Misty Moore")
    expect(page).to_not have_content("Kingston Brown")
  end

  it 'the list of passengers is unique and includes adults' do 
    airline_1 = Airline.create!(name: 'American')
    airline_2 = Airline.create!(name: 'Delta')
    
    flight_1 = Flight.create!(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: airline_1.id)
    flight_2 = Flight.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline_id: airline_1.id)
    flight_3 = Flight.create!(number: "9091", date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: airline_1.id)
    
    passenger_1 = Passenger.create!(name: "Joe", age: 18)
    passenger_2 = Passenger.create!(name: "Alfred", age: 9)
    passenger_3 = Passenger.create!(name: "Bill Seacaster", age: 46)
    passenger_4 = Passenger.create!(name: "Harry", age: 5)
    
    
    flight_passenger_1 = FlightPassenger.create!(flight: flight_1, passenger: passenger_1)
    flight_passenger_2 = FlightPassenger.create!(flight: flight_2, passenger: passenger_2)
    flight_passenger_3 = FlightPassenger.create!(flight: flight_3, passenger: passenger_3)
    flight_passenger_4 = FlightPassenger.create!(flight: flight_3, passenger: passenger_1)


    visit "/airlines/#{airline_1.id}"

    expect(page).to have_content("Joe", count: 1)
    expect(page).to have_content("Bill Seacaster", count: 1)

    expect(page).to_not have_content("Harry")
    expect(page).to_not have_content("Alfred")
  end
end 