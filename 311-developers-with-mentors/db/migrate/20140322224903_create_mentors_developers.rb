class CreateMentorsDevelopers < ActiveRecord::Migration
  def change
    create_table :mentors_developers do |t|
      t.integer :mentor_id
      t.integer :developer_id

      t.timestamps
    end
  end
end
