class CategoriesController < ApplicationController
before_action :require_login_redirect, only: [:new,:edit, :update, :create, :destroy]
before_action :require_admin,only:[:new,:create]

def index
  @all_categories=Category.all
end 

def show
  assign_category_instance_variable
  # @category=Category.find_by(params[:id])
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
  assign_category_instance_variable
end

def update
  assign_category_instance_variable
    @category.update_attributes(strong_params)
    
  if @category.save
    redirect_to categories_path
  else
    flash[:error] = "Category was not edited"
    render 'new'
  end
end

def assign_category_instance_variable
  @category=Category.find_by(slug: params[:id])
end

private

def strong_params
  #TODO: FIX THIS AFTER TESTING
  # params.require(:category).permit(:name)
  params.require(:category).permit!
end

end