class IngredientsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.create(ingredient_params)
    redirect_to edit_recipe_path(@recipe)
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:user_id, :name, :quantity, :unit_id)
  end
end
