class AddLocationIdToFoodTrucks < ActiveRecord::Migration
  def change
    add_column :food_trucks, :location_id, :integer
  end
end
