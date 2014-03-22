class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :area

      t.timestamps
    end
  end
end
