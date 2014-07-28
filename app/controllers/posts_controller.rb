class PostsController < ApplicationController
  def index
    @all_posts=Post.all
  end

  def show
    @params_hash=params.inspect
    @post=Post.find(params[:id])
  end

  def new #create a new one
  end

  def create #handles the submission of the new post
  end

  def edit
  end

  def update
  end


end
