class SessionsController < ApplicationController

def new
end

def create
  user=User.find_by username: params["username"]
  binding.pry
  if user && user.authenticate(params["password"])
    flash[:alert]="Logged in successfully."
    session[:user_id]=user.id
    binding.pry
    redirect_to posts_path
  else
    flash[:alert]="Something was wrong with your username or password"
    redirect_to login_path
  end
end

def destroy
  session[:user_id]=nil
  flash[:alert]="You have successfully logged out."
  redirect_to posts_path
end

end








