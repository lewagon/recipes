class RecipesController < ApplicationController
  def index
    query = params.dig(:search, :query)
    session[:query] = query.present? ? query : nil

    begin
      @pagy, @recipes = pagy(session[:query].present? ? Recipe.search(query) : Recipe.all)
    rescue Pagy::OverflowError => _e
      @pagy, @recipes = pagy(session[:query].present? ? Recipe.search(query) : Recipe.all, page: 1)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def advanced_index; end

  def advanced_show; end
end
