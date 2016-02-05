class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
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

  def destroy
  end
  private
    def recipe_params
      params.require(:recipe).permit(:name, :summery , :description,:picture)
    end
end
