class Mentor < ActiveRecord::Base
    has_many :mentors_developers
    has_many :developers, through: :mentors_developers
end
