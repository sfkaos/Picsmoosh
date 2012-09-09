class Picture < ActiveRecord::Base
  attr_accessible :comments, :description, :height, :likes, :photo_url, :social_network, :taken_at, :updated_at, :user_name, :user_photo_url, :width
end

