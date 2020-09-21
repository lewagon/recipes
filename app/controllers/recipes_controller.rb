class RecipesController < ApplicationController
  def index
    @pagy, @recipes = pagy(Recipe.all)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def advanced_index; end

  def advanced_show; end
end
