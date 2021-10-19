module ApplicationCable
  class Connection < ActionCable::Connection::Base
    #   identified_by :current_user

    #   def connect
    #     params = request.query_parameters

    #     access_token = params['access-token']
    #     uid = params['uid']
    #     client = params['client']

    #     self.current_user = find_verified_user access_token, uid, client
    #     logger.add_tags 'ActionCable', current_user.email
    #   end

    #   protected

    #   def find_verified_user(token, uid, client_id) # this checks whether a user is authenticated with devise
    #     user = User.find_by email: uid
    #     # http://www.rubydoc.info/gems/devise_token_auth/0.1.38/DeviseTokenAuth%2FConcerns%2FUser:valid_token%3F
    #     if user && user.valid_token?(token, client_id)
    #       user
    #     else
    #       reject_unauthorized_connection
    #     end
    #   end
  end
end
