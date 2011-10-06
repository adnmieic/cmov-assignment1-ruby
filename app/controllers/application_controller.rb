class ApplicationController < ActionController::Base
  before_filter :authenticate
  protect_from_forgery

private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      u = User.find_by_username(username)
      if u
        u.valid_password?(password)
      else
        false
      end
    end
  end
end
