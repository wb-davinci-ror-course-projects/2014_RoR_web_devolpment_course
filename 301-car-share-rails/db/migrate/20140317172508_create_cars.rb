class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
     t.string  :color
     t.string  :model
     t.integer :member_id
    end
  end
end
