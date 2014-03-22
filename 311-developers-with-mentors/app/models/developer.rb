class Developer < ActiveRecord::Base
    has_many :mentors_developers
    has_many :mentors, through: :mentors_developers
end
