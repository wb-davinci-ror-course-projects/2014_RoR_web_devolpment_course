class Sightings < ActiveRecord::Migration
  def change
    create_table :sightings do |e|
    e.string :date
    e.string :description
    end
  end
end
