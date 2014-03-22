class CreateTravelLogs < ActiveRecord::Migration
  def change
    create_table :travel_logs do |t|
      t.string :direction
      t.integer :location_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
