require 'rails_helper'

RSpec.describe 'Flight index page' do
  it 'has a list of all the flight numbers' do 
    airline_1 = Airline.create!(name: 'American')
    airline_2 = Airline.create!(name: 'Delta')
    airline_3 = Airline.create!(name: 'JetBlue')
    airline_4 = Airline.create!(name: 'SouthWest')

    flight_1 = Flight.create!(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: airline_1.id)
    flight_2 = Flight.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline_id: airline_1.id)
    flight_3 = Flight.create!(number: "9091", date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: airline_2.id)
    flight_4 = Flight.create!(number: "6798", date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline_id: airline_3.id)
    flight_5 = Flight.create!(number: "9665", date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline_id: airline_4.id)

    visit '/flights'

    expect(page).to have_content("7990")
    expect(page).to have_content("3940")
    expect(page).to have_content("9091")
    expect(page).to have_content("6798")
    expect(page).to have_content("9665")
  end

  it 'has the name of the airline for each flight' do 
    airline_1 = Airline.create!(name: 'American')
    airline_2 = Airline.create!(name: 'Delta')
    airline_3 = Airline.create!(name: 'JetBlue')
    airline_4 = Airline.create!(name: 'SouthWest')

    flight_1 = Flight.create!(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: airline_1.id)
    flight_2 = Flight.create!(number: "3940", date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando", airline_id: airline_1.id)
    flight_3 = Flight.create!(number: "9091", date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: airline_2.id)
    flight_4 = Flight.create!(number: "6798", date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline_id: airline_3.id)
    flight_5 = Flight.create!(number: "9665", date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline_id: airline_4.id)

    visit '/flights'

    within "#flight-#{flight_1.id}" do 
      expect(page).to have_content("American")
    end

    within "#flight-#{flight_2.id}" do 
      expect(page).to have_content("American")
    end

    within "#flight-#{flight_3.id}" do 
      expect(page).to have_content("Delta")
    end

    within "#flight-#{flight_4.id}" do 
      expect(page).to have_content("JetBlue")
    end

    within "#flight-#{flight_5.id}" do 
      expect(page).to have_content("SouthWest")
    end
  end

  it 'has the names for all the flights passengers' do 
    airline_1 = Airline.create!(name: 'American')
    airline_2 = Airline.create!(name: 'Delta')
    airline_3 = Airline.create!(name: 'JetBlue')
    airline_4 = Airline.create!(name: 'SouthWest')

    flight_1 = Flight.create!(number: "7990", date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: airline_1.id)
    flight_3 = Flight.create!(number: "9091", date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: airline_2.id)
    flight_4 = Flight.create!(number: "6798", date: "10/9/2022", departure_city: "Tulsa", arrival_city: "Fresno", airline_id: airline_3.id)
    flight_5 = Flight.create!(number: "9665", date: "11/22/2022", departure_city: "Durham", arrival_city: "New Orleans", airline_id: airline_4.id)

    passenger_1 = Passenger.create!(name: "Brennan Lee Mulligan", age: 13)
    passenger_2 = Passenger.create!(name: "Aabria Iyengar", age: 9)
    passenger_3 = Passenger.create!(name: "Bill Seacaster", age: 46)
    passenger_4 = Passenger.create!(name: "Misty Moore", age: 44)
    passenger_5 = Passenger.create!(name: "Kingston Brown", age: 84)


    flight_passenger_1 = FlightPassenger.create!(flight: flight_1, passenger: passenger_1)
    flight_passenger_1 = FlightPassenger.create!(flight: flight_3, passenger: passenger_3)
    flight_passenger_1 = FlightPassenger.create!(flight: flight_4, passenger: passenger_4)
    flight_passenger_1 = FlightPassenger.create!(flight: flight_5, passenger: passenger_5)

    visit '/flights'
    save_and_open_page
    within "#flight-#{flight_1.id}" do 
      expect(page).to have_content(passenger_1.name)
    end

    within "#flight-#{flight_3.id}" do 
      expect(page).to have_content(passenger_3.name)
    end

    within "#flight-#{flight_4.id}" do 
      expect(page).to have_content(passenger_4.name)
    end

    within "#flight-#{flight_5.id}" do 
      expect(page).to have_content(passenger_5.name)
    end
  end
end