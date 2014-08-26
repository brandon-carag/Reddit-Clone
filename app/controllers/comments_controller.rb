class CommentsController < ApplicationController
before_action :require_login_redirect, only: [:new,:edit, :update, :create, :destroy,:vote]
  

def index
end

def show
end

def new
  assign_post_instance_variable
  @comment=@post.comments.new
end

def create
  assign_post_instance_variable
  binding.pry
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
    @comment=Comment.find_by id:params[:id]
    
    respond_to do |format|
      format.html do
        if @vote.save
        flash[:notice] = "Vote counted"
        redirect_to :back
        else
        flash[:error] = "You can only vote once for this comment"
        redirect_to :back
        end
      end
      format.js{render '/shared/show_updated_comment_vote_count'}
    end

    
end

def assign_post_instance_variable
  @post=Post.find_by(slug: params[:post_id])
end

private

def strong_params
    params.require(:comment).permit(:body)
end

end