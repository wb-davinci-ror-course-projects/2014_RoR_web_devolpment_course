class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :tool_name
      t.integer :person_id

      t.timestamps
    end
  end
end
