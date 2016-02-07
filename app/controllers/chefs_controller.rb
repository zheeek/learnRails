class ChefsController < ApplicationController
  
  before_action :require_same_user , only: [:edit,:update]
  before_action :set_chef , only: [:edit,:update,:show]
   def index
     @chefs = Chef.paginate(page: params[:page], per_page: 9)
   end
  
  def new
    @chef = Chef.new
  end

  def create
    @chef=Chef.create(chef_params)
    if @chef.save
      flash['success'] = 'your account create successfuly'
      flash['success'] = 'register successfuly'
      session[:chef_id] = @chef.id
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      flash['success'] = 'Your Account Update Successfuly'
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
  end
  
  def show
    @recipes = @chef.recipes.paginate(page: params[:page] , per_page: 3)
  end

 
  
  private
  def chef_params
    params.require(:chef).permit(:name,:email,:password)
  end
  
  def require_same_user
    if current_user == @chef
      flash['danger'] = 'you can just deit and update your own account'
      redirect_to :back
    end
  end
  def set_chef
    @chef = Chef.find(params['id'])
  end
  
end
