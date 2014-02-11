class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
    t.string :word
    t.string :part_of_speech
    t.string :definition
    end
  end
end
