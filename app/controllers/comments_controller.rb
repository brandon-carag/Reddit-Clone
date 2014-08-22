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
  @comment.user_id=current_user.id
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

def vote
    @vote=Vote.new(user_id:current_user.id,vote:params["vote"],voteable_type: "Comment",voteable_id:params[:id])
    if @vote.save
      flash[:notice] = "Vote counted"
      redirect_to :back
    else
      flash[:notice] = "You can only vote once for this comment"
      redirect_to :back
    end
end


private

def strong_params
    params.require(:comment).permit(:body)
end

end