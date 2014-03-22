class Play < ActiveRecord::Base
   has_many :actors_plays
   has_many :actors, through: :actors_plays
end
