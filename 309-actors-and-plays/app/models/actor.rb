class Actor < ActiveRecord::Base
 has_many :actors_plays
 has_many :plays, through: :actors_plays
end
