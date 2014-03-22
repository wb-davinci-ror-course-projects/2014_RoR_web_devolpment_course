class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :boss_id
      t.timestamps
    end
  end
end
