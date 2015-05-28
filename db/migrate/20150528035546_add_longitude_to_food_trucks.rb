class AddLongitudeToFoodTrucks < ActiveRecord::Migration
  def change
    add_column :food_trucks, :longitude, :float
    add_column :food_trucks, :latitude, :float
  end
end
