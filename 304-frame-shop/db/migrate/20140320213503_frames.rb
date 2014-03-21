class Frames < ActiveRecord::Migration
  def change
    create_table  :frames do |t|
      t.string    :material
      t.float     :price
    end
  end
end
