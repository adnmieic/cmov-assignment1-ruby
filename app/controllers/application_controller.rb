class ApplicationController < ActionController::Base
  @current_user = nil
  before_filter :authenticate
  protect_from_forgery

private
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      u = User.find_by_username(username)
      if u
        if u.valid_password?(password)
          @current_user = u
        else
          false
        end
      else
        false
      end
    end
  end
end
