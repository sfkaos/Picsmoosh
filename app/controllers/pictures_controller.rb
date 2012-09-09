class PicturesController < ApplicationController
  def index
    # user = FbGraph::User.me($fb_access_token).fetch
    # 
    # friends = user.friends
    # @my_photos = user.photos[0,5]
    # 
    # @friend_photos = friends[0,5].collect{|f| f.photos(:limit => 5)}.flatten
    
    @pictures = Picture.all
  end
end
