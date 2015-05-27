class AddJsonToFoodTrucks < ActiveRecord::Migration
  def change
    add_column :food_trucks, :json, :string
  end
end
