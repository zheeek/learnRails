class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.paginate(:page => params[:page], :per_page => 5)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1)
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
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = 'updated successfuly'
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
    
  end

  def show
    @recipe =Recipe.find(params[:id])
  end
  def like
    #binding.pry
    @recipe = Recipe.find(params[:id])
    like = Like.create(like: params['like'] , chef: Chef.first ,recipe: @recipe)
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
end
