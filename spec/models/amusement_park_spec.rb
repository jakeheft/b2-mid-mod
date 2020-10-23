require 'rails_helper'

describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many :rides }
  end

  describe "instance methods" do
    it "#average_thrill" do
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

      expect(adventureland.average_thrill.round(4)).to eq(6.6667)
    end
  end
end
