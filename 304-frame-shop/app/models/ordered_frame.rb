class OrderedFrame < ActiveRecord::Base
  validates :inches, numericality: { only_integer: true }
  belongs_to :frame, class_name: "Frame", foreign_key: "frame_id"
end