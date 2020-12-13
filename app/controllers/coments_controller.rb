class ComentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.coments.create(coment_params)
    redirect_to recipe_path(@recipe)
  end

  private
  def coment_params
    params.require(:coment).permit(:user_id, :body)
  end
end
