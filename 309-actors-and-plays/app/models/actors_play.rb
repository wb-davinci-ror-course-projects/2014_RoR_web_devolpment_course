class ActorsPlay < ActiveRecord::Base
  belongs_to :actor
  belongs_to :play
end
