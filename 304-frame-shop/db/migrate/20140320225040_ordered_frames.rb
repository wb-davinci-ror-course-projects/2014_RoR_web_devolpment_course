class OrderedFrames < ActiveRecord::Migration
  def change
    create_table  :ordered_frames do |t|
      t.string    :material
      t.float     :price
      t.string    :hardware
      t.integer   :inches
      t.string    :frame_id
      t.float     :total_price
    end
  end
end
