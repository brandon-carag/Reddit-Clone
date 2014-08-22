class CategoriesController < ApplicationController
before_action :require_login_redirect, only: [:new,:edit, :update, :create, :destroy]

def index
  @all_categories=Category.all
end 

def show
  @category=Category.find(params[:id])
end

def new
  @category=Category.new
end

def create
  @category=Category.new(strong_params)

  if @category.save
    flash[:notice] = "Category was created!"
    redirect_to categories_path
    else
    render 'new'
  end
end
#====================
def edit
  @category=Category.find(params[:id])
end

def update
  @category=Category.find(params[:id])
    @category.update_attributes(strong_params)
    
  if @category.save
    redirect_to categories_path
  else
    flash[:error] = "Category was not edited"
    render 'new'
  end
end



private

def strong_params
  #FIX THIS AFTER TESTING
  # params.require(:category).permit(:name)
  params.require(:category).permit!
end

end