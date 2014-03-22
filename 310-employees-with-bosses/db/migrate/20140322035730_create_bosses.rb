class CreateBosses < ActiveRecord::Migration
  def change
    create_table :bosses do |t|
      t.string :first_name

      t.timestamps
    end
  end
end
