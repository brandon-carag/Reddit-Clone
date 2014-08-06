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
    redirect_to posts_path
  else
    render '/posts/show'
    # render '/shared/_comment_form'
    # render '/new'
  end
end

private

def strong_params
    params.require(:comment).permit(:body)
end

end