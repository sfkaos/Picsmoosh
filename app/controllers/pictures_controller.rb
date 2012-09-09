class PicturesController < ApplicationController
  before_filter :init

  def index
    # user = FbGraph::User.me($fb_access_token).fetch
    # 
    # friends = user.friends
    # @my_photos = user.photos[0,5]
    # 
    # @friend_photos = friends[0,5].collect{|f| f.photos(:limit => 5)}.flatten
    
    @s = Picture.where("height/width=1").order("likes + comments DESC")
    @l = Picture.where("height/(width*1.0) = 0.75").order("likes + comments DESC")
    @p = Picture.where("(height/(width*1.0) > 1.3) AND (height/(width*1.0) < 1.4)").order("likes + comments DESC")

    @layout.each do |col|
      col.each do |elem|
        if elem[0] == :p
          elem[2] = elem[1] * 1.5
          elem << @p.shift
        elsif elem[0] == :s
          elem[2] = elem[1]
          elem << @s.shift
        elsif elem[0] == :l
          elem[2] = elem[1] / 1.5
          elem << @l.shift
        end
      end
    end

  end

private

  def init
      @layout = []
      @layout[0] = [
        [:p, 400,1],
        [:p, 200,2],
        [:p, 200,3],
        [:s, 400,4],
        [:p, 200,5],
        [:p, 200,6],
        [:p, 200,7],
        [:p, 200,8],
        [:p, 400,9],      
        [:p, 400,1],
        [:p, 200,2],
        [:p, 200,3],
        [:s, 400,4],
        [:p, 200,5],
        [:p, 200,6],
        [:p, 200,7],
        [:p, 200,8],
        [:p, 400,9]      
      ]

      @layout[1] = [
        [:l, 375,10],
        [:s, 375,11],
        [:l, 375,12],
        [:l, 375,13],
        [:p, 375,14],
        [:l, 375,15],
        [:l, 375,16],
        [:l, 375,17],
        [:l, 375,10],
        [:s, 375,11],
        [:l, 375,12],
        [:l, 375,13],
        [:p, 375,14],
        [:l, 375,15],
        [:l, 375,16],
        [:l, 375,17]
      ]
    
      @layout[2] = [
        [:s, 50,18],
        [:s, 50,18],
        [:s, 50,18],
        [:s, 50,18],
        [:s, 200,18],
        [:l, 200,19],
        [:s, 200,20],
        [:p, 200,21],
        [:s, 200,22],
        [:p, 200,23],
        [:l, 200,24],
        [:l, 200,25],
        [:s, 50,18],
        [:s, 50,18],
        [:s, 50,18],
        [:s, 50,18],
        [:s, 200,18],
        [:l, 200,19],
        [:s, 200,20],
        [:p, 200,21],
        [:s, 200,22],
        [:p, 200,23],
        [:l, 200,24],
        [:l, 200,25],
        [:s, 50,18],
        [:s, 50,18],
        [:s, 50,18],
        [:s, 50,18],
        [:s, 200,18],
        [:l, 200,19],
        [:s, 200,20],
        [:p, 200,21],
        [:s, 200,22],
        [:p, 200,23],
        [:l, 200,24],
        [:l, 200,25]
              ]  
     
  end

end
