class Location < ActiveRecord::Base
  has_many :travel_logs
  has_many :destinations, through: :travel_logs
end
