class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(2)
    
    if @recipe.save(recipe_params)
      #do some shit
      flash[:success] = "Recipe created, yo"
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      #do some shit
      flash[:success] = "Yea we edited it"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
    
  end
  
  private
    
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
  
end