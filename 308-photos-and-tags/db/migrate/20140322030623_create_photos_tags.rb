class CreatePhotosTags < ActiveRecord::Migration
  def change
    create_table :photos_tags, id: false do |t|
      t.integer :photo_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
