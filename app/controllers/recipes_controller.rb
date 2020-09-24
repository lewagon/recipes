class RecipesController < ApplicationController
  before_action :set_recipe, only: [ :show, :advanced_show ]

  def index
    query = params.dig(:search, :query)
    session[:query] = query.present? ? query : nil
    @pagy, @recipes = pagy(session[:query].present? ? Recipe.search(query) : Recipe.all)
  end

  def show; end

  def advanced_index; end

  def advanced_show; end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
