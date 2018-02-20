class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  private

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(email: options[:email], access_token: token)
    end
  end
end
