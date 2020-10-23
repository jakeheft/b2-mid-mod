require 'rails_helper'

describe "When I visit the mechanics index page" do
  it "I see a list of all mechanics' names and years of experience" do
    roy = Mechanic.create(
      name: "Roy Rogers",
      experience: 22
    )
    molly = Mechanic.create(
      name: "Molly Miller",
      experience: 1
    )
    sue = Mechanic.create(
      name: "Sue Simmons",
      experience: 26
    )
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("#{roy.name} - #{roy.experience} years of experience")
    expect(page).to have_content("#{molly.name} - #{molly.experience} years of experience")
    expect(page).to have_content("#{sue.name} - #{sue.experience} years of experience")
  end
end
