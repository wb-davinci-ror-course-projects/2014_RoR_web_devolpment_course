class WorldCities < ActiveRecord::Migration
  def change
    create_table :world_cities do |w|
    w.string :city
    w.string :flag  
    w.string :time
    w.string :population
    end
  end
end
