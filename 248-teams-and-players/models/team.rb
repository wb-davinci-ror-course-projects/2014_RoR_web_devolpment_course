class Team < ActiveRecord::Base
  has_many :players, class_name: "Player", foreign_key: "team_id"
end
