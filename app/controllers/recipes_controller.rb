class RecipesController < ApplicationController
  require 'tools/YTrans'
  def index
    @recipes = Recipe.all
    @traslate_text = YTrans::translate_text 'run', 'en', 'ru'
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if(@recipe.save)
      redirect_to edit_recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if(@recipe.update(recipe_params))
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end

  private def recipe_params
    params.require(:recipe).permit(:name, :body, :user_id )
  end
end
