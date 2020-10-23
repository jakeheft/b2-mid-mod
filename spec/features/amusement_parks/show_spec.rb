require 'rails_helper'

describe "When I visit an amusement park's show page" do
  it "I see its name, admission price, its rides, and average thrill rating" do
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
    visit "/amusement_parks/#{adventureland.id}"
    
    expect(page).to have_content(adventureland.name)
    expect(page).to have_content("Admissions: $#{adventureland.price}")
    expect(page).to have_content(comet.name)
    expect(page).to have_content(coaster.name)
    expect(page).to have_content(spinny.name)
    expect(page).to have_content("Average Thrill Rating of Rides: #{adventureland.average_thrill.round(1)}/10")
  end
end
