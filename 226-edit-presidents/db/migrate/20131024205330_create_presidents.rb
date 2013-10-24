class CreatePresidents < ActiveRecord::Migration
  def change
    create_table :presidents do |t|
      t.string  :name
      t.text    :biography
      t.boolean :ended_term_early
      t.string  :party
      t.string  :occupation_before_politics
    end
  end
end
