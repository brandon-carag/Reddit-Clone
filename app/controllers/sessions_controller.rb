class SessionsController < ApplicationController

def new
end

def create
  user=User.find_by username: params["username"]
  if user && user.authenticate(params["password"])
    flash[:notice]="Logged in successfully."
    session[:user_id]=user.id
    redirect_to posts_path
  else
    flash[:error]="Something was wrong with your username or password"
    redirect_to login_path
  end
end

def destroy
  session[:user_id]=nil
  flash[:notice]="You have successfully logged out."
  redirect_to posts_path
end

end








