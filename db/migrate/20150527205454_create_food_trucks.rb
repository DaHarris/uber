class CreateFoodTrucks < ActiveRecord::Migration
  def change
    create_table :food_trucks do |t|
      t.string :name
      t.string :location_description
      t.string :schedule
      t.string :location
      t.string :food
    end
  end
end
