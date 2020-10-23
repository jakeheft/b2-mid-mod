require 'rails_helper'

describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe "instance methods" do
    it "#alphabetize_rides" do
      adventureland = AmusementPark.create(
        name: "Adventureland",
        price: 25.00
      )
      comet = Ride.create(
        name: "Vomit Comet",
        rating: 10,
        amusement_park_id: adventureland.id
      )
      coaster = Ride.create(
        name: "Generic Roller Coaster",
        rating: 4,
        amusement_park_id: adventureland.id
      )
      spinny = Ride.create(
        name: "Spinny Pods",
        rating: 6,
        amusement_park_id: adventureland.id
      )
      roy = Mechanic.create(
        name: "Roy Rogers",
        experience: 22
      )
      MechanicRide.create(
        mechanic_id: roy.id,
        ride_id: comet.id
      )
      MechanicRide.create(
        mechanic_id: roy.id,
        ride_id: coaster.id
      )
      MechanicRide.create(
        mechanic_id: roy.id,
        ride_id: spinny.id
      )

      expect(roy.alphabetize_rides).to eq([coaster, spinny, comet])
    end
  end
end
