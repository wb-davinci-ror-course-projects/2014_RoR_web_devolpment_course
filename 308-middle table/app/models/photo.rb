class Photo < ActiveRecord::Base
    has_many :photos_tags
    has_many :tags, through: :photos_tags
end
