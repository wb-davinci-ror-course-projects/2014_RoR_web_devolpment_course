class MultiTests < ActiveRecord::Migration
  def change
    create_table :multi_tests do |t|
      t.string :problem
      t.string :question
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :answer4
      end
  end
end
