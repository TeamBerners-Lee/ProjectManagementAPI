class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods

  protected
     def authenticate
      # p request.env['HTTP_AUTHORIZATION'].gsub(/Token token=/,'')
      authenticate_or_request_with_http_token do |token, options|
      User.find_by(token: token)
    end
  end
end
