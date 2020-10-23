require 'rails_helper'

describe "When I visit a mechanics show page I see the mechanic's info" do
  it "I can fill out a form to add a ride_id from the db to the mechanics list and upon submitting I see that ride listed on this show page" do
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

    visit "mechanics/#{roy.id}"

    expect(page).to have_content("Mechanic: #{roy.name}")
    expect(page).to have_content("Years of Experience: #{roy.experience}")
    expect(page).to have_content(comet.name)
    expect(page).to have_content(coaster.name)
    expect(page).to_not have_content(spinny.name)

    fill_in :ride_id, with: spinny.id
    click_button "Submit"

    expect(current_path).to eq("/mechanics/#{roy.id}")
    expect(page).to have_content(spinny.name)
  end
end

describe "On the mechanic show page" do
  it "Rides are shown alphabetically" do
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

    visit "mechanics/#{roy.id}"
save_and_open_page
    expect(page.all('li')[0]).to have_content(coaster.name)
    expect(page.all('li')[1]).to have_content(spinny.name)
    expect(page.all('li')[2]).to have_content(comet.name)
  end
end
