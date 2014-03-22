class MentorsDeveloper < ActiveRecord::Base
    belongs_to :mentor
    belongs_to :developer
end
