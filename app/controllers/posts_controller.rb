class PostsController < ApplicationController
before_action 

  def index
    @all_posts=Post.all
  end

  def show
    @post=Post.find(params[:id])
    @comment=Comment.new
  end

  def new
    @post=Post.new
  end

  def create
    binding.pry
    @post=Post.new(strong_params)
    #In the form, we would need to make sure that some sort of category
    #assignment took place.  A basic assignment would be 
    # @post.categories <

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end
#===================
  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    @post.update_attributes(strong_params)

    if @post.save
      flash[:notice] = "Post successfully edited"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  private

  def strong_params
    # UNCOMMENT THIS IF IT WORKS:
    # params.require(:post).permit(:url,:title,:description)
    params.require(:post).permit!
    #I think the reason this works is not because you
    #pass in a function into the update_attributes method
    #but because "require(:post).permit! enables you
    #to send things over"
  end

end
