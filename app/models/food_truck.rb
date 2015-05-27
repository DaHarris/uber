class FoodTruck < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :location_id, presence: true, uniqueness: true

end
