class Destination < ActiveRecord::Base
  has_many :travel_logs
  has_many :locations, through: :travel_logs
end
