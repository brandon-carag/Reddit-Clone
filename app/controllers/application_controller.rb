class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

helper_method :current_user,:logged_in?,:require_login_redirect,:admin?,:admin_or_creator_edit_privilege

#returns current user OBJECT
def current_user
  @current_user||=User.find_by id: session["user_id"] if session["user_id"]
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

def admin?
  current_user.role=="admin"
end

def require_admin
  unless admin?
    flash[:error] = "Sorry, you do not have the privileges necessary to take this action."
    redirect_to posts_path
  end
end

def admin_or_creator_edit_privilege
  unless admin? or @post.creator==current_user
  flash[:error] = "Sorry, you cannot edit this post because you are not its creator."
  redirect_to post_path(@post)
  end
end

end

