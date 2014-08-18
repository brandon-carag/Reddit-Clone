class CommentsController < ApplicationController

def index
end

def show
end

def new
  @post=Post.find(params[:post_id])
  @comment=@post.comments.new
end

def create
  @post=Post.find(params[:post_id])
  @comment=@post.comments.new(strong_params)
  if @comment.save
    flash[:notice] = "Comment successfully saved!"
    redirect_to post_path(params[:post_id])
  else
    render 'posts/show'
    # redirect_to post_path(params[:post_id])
    # render '/posts/show'
    # render '/shared/_comment_form'
    # render '/new'
  end
end

private

def strong_params
    params.require(:comment).permit(:body)
end

end