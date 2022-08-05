class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers

  def distinct_passengers
    passengers.select('passengers.*')
    .where('passengers.age > ?', '17')
    .distinct
  end
end