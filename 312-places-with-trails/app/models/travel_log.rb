class TravelLog < ActiveRecord::Base
  belongs_to :location
  belongs_to :destination
end
