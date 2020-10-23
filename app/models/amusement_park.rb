class AmusementPark < ApplicationRecord
  has_many :rides

  def average_thrill
    Ride.where(amusement_park_id: id).average(:rating)
  end
end
