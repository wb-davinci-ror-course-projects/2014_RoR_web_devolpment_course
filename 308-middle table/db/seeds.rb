Photo.create! title: "Flatirons at dawn"
Photo.create! title: "Flatirons at sunset"
Photo.create! title: "Sunset from my window"
Photo.create! title: "Mysterious blur"

ActiveRecord::Base.connection.reset_pk_sequence! "photos"

Tag.create! name: "Flatirons"
Tag.create! name: "dawn"
Tag.create! name: "sunset"
Tag.create! name: "Pluto"

ActiveRecord::Base.connection.reset_pk_sequence! "tags"

PhotosTag.create! photo_id: 1, tag_id: 1
PhotosTag.create! photo_id: 1, tag_id: 2
PhotosTag.create! photo_id: 2, tag_id: 1
PhotosTag.create! photo_id: 2, tag_id: 3
PhotosTag.create! photo_id: 3, tag_id: 3
ActiveRecord::Base.connection.reset_pk_sequence! "photos_tags"
