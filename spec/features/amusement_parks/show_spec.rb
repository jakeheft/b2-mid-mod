require 'rails_helper'

describe "When I visit an amusement park's show page" do
  it "I see its name, admission price, its rides, and average thrill rating" do
    adventureland = AmusementPark.create(
      name: "Adventureland",
      price: 25.0
    )
    comet = Ride.create(
      name: "Vomit Comet",
      rating: 10
    )
    coaster = Ride.create(
      name: "Generic Roller Coaster",
      rating: 4
    )
    spinny = Ride.create(
      name: "Spinny Pods",
      rating: 6
    )
    visit "/amusement_parks/#{adventureland.id}"

    expect(page).to have_content(adventureland.name)
    expect(page).to have_content(comet.name)
    expect(page).to have_content(coaster.name)
    expect(page).to have_content(spinny.name)
    expect(page).to have_content("Average Thrill Rating of Rides: #{average_thrill.round(1)}/10")
  end
end
