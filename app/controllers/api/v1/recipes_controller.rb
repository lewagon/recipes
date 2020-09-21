class Api::V1::RecipesController < Api::V1::BaseController
  def index
    @pagy, @recipes = pagy(Recipe.all)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
