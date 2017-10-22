class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    # creating 2 recipe ingredient instances here makes the form create two different ingredient objects associated with this recipe
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
    #byebug
    @recipe = Recipe.new(recipe_params)
    if @recipe.save!
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end



  private

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes:[:name, :quantity])
  end

end
