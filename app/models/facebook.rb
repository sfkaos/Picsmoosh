class Facebook

  def profile
    @profile ||= FbGraph::User.me(self.access_token).fetch
  end

  class << self
    extend ActiveSupport::Memoizable

    def config      
        {
          :client_id     => client_id,
          :client_secret => client_secret,
          :scope         => [:friends_photos, :friends_relationship_details, :friends_relationships, :user_photos, :user_relationship_details, :user_relationships],
          :canvas_url    => ENV['fb_canvas_url']
        }
    end
    
    def client_id
      '148302408644162'
    end
    def client_secret
      '290c5678ab21bdf4e0778fae15012abe'
    end

    def app
      FbGraph::Application.new client_id, :secret => client_secret
    end

    def auth(redirect_uri = nil)
      FbGraph::Auth.new client_id, client_secret, :redirect_uri => redirect_uri
    end

    def identify(fb_user)
      _fb_user_ = find_or_initialize_by_identifier(fb_user.identifier.try(:to_s))
      _fb_user_.access_token = fb_user.access_token.access_token
      _fb_user_.save!
      _fb_user_
    end
  end

end