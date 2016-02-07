class RecipesController < ApplicationController
  
  before_action :require_user , except: [:index,:show]
  before_action :set_recipe , only: [:edit,:update,:show,:like]
  before_action :require_same_user , only: [:edit,:update]
  def index
    @recipes = Recipe.paginate(:page => params[:page], :per_page => 5)
  end
 
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user
    if @recipe.save
      flash[:success]= 'با موفقیت درج شد'
      redirect_to recipes_path
    else
      render :new
    end
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = 'updated successfuly'
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
    
  end

  def show
  end
  def like
    #binding.pry
    like = Like.create(like: params['like'] , chef: current_user ,recipe: @recipe)
    if like.valid?
      flash[:success]  = 'thank you for voting'
      redirect_to :back
    else
      flash[:danger]  = 'you can vote once for a recipe'
      redirect_to :back
    end
  end
  def destroy
  end
  private
    def recipe_params
      params.require(:recipe).permit(:name, :summery , :description,:picture)
    end
    
    def require_same_user
      if current_user != @recipe.chef
        flash['danger'] = 'you can modify your own recipe '
        redirect_to recipes_path
      end
    end
    
    def set_recipe
      @recipe = Recipe.find(params[:id])      
    end
end
