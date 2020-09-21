class RecipesController < ApplicationController
  before_action :set_recipe, only: [ :show, :advanced_show ]

  def index
    @pagy, @recipes = pagy(Recipe.all)
  end

  def show; end

  def advanced_index; end

  def advanced_show; end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
