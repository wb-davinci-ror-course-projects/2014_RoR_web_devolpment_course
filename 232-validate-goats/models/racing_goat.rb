class RacingGoat < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :gender, presence: true
end
