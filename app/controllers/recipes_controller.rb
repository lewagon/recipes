class RecipesController < ApplicationController
  def index
    query = params.dig(:search, :query) || params.dig(:query)
    session[:query] = query.present? ? query : nil

    begin
      @pagy, @recipes = pagy(session[:query].present? ? Recipe.order(:name).search(query) : Recipe.order(:name))
    rescue Pagy::OverflowError => _e
      redirect_to root_path(page: 1)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def advanced_index; end

  def advanced_show; end
end
