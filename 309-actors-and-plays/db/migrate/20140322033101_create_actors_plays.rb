class CreateActorsPlays < ActiveRecord::Migration
  def change
    create_table :actors_plays do |t|
      t.string :character
      t.integer :actor_id
      t.integer :play_id

      t.timestamps
    end
  end
end
