class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :pictures do |t|
      t.string :photo_url
      t.integer :height
      t.integer :width
      t.text :description
      t.integer :likes
      t.integer :comments
      t.string :social_network
      t.datetime :taken_at

      t.string :user_name
      t.string :user_photo_url
      
      t.timestamps
    end
  end

  def down
    drop_table :pictures
  end
end
