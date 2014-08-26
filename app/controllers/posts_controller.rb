class PostsController < ApplicationController
before_action :require_login_redirect, only: [:new,:edit, :update, :create, :destroy,:vote]

  def index
    @all_posts=Post.all
  end

  def show
    # @post=Post.find(params[:id])
    assign_post_instance_variable
    @comment=Comment.new
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(strong_params)
    @post.user_id=current_user.id
    
    if @post.save
      flash[:notice] = "Post successfully saved!"
      redirect_to posts_path
    else
      render 'new'
    end
  end
#===================
  def edit
    assign_post_instance_variable
  end

  def update
    assign_post_instance_variable
    # @post.update_attributes(strong_params)
    if @post.update(strong_params)
      flash[:notice] = "Post successfully edited!"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def vote
    @post=Post.find(params[:id])
    @vote=Vote.new(user_id:current_user.id,vote:params["vote"],voteable_type: "Post",voteable_id:@post.id)
    # if @vote.save
      #Rails determines the desired response format from the HTTP Accept header submitted by the client
      respond_to do |format|
        format.html do
          if @vote.save
            flash[:notice] = "Vote counted"
            redirect_to :back
          else
            flash[:error] = "You can only vote once for #{@post.title}"
            redirect_to :back
          end
        end
        format.js {render '/shared/show_updated_vote_count'}
        end
    #   end
    #   flash[:notice] = "Vote counted"
    # else
    #   flash[:error] = "You can only vote once for #{@post.title}"
    #   redirect_to :back
    #   # it doesn't seem to be redirecting
      # redirect_to :back

      # If I try and direct it to a completely new path, it won't go there either... so perhaps it's stuck somewhere in the
      # rendering of the js
    
  end

  def assign_post_instance_variable
    @post=Post.find_by(slug: params[:id])
  end



#PRIVATE METHODS==============================================================

  private
  
  def strong_params
    # UNCOMMENT THIS IF IT WORKS:
    # params.require(:post).permit(:url,:title,:description,:category_ids)
    params.require(:post).permit!
    #I think the reason this works is not because you
    #pass in a function into the update_attributes method
    #but because "require(:post).permit! enables you
    #to send things over"
  end

end
