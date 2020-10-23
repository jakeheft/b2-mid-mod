class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def alphabetize_rides
    self.rides.order(:name)
  end
end
