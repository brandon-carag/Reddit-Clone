class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

helper_method :current_user,:logged_in?,:require_login_redirect

#returns current user OBJECT
def current_user
  @current_user=User.find_by id: session["user_id"]
end

def logged_in?
  current_user != nil
end

def require_login_redirect
  unless logged_in?
    flash[:error] = "Please login to take this action."
    redirect_to login_path
  end
end

end

