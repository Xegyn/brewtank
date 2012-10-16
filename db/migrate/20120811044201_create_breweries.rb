class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :location
      t.boolean :tasting_room

      t.timestamps
    end
  end
end
