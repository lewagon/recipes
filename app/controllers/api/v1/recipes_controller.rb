class Api::V1::RecipesController < Api::V1::BaseController
  def index
    query = params.dig(:search, :query) || params.dig(:query)
    session[:query] = query.present? ? query : nil
    begin
      @pagy, @recipes = pagy(
        session[:query].present? ? Recipe.order(:name).search(session[:query]) : Recipe.order(:name),
        link_extra: "data-remote='true' data-action='click->recipes#renderRecipes' data-target='recipes.paginationLink'"
      )
    rescue Pagy::OverflowError => _e
      @pagy, @recipes = pagy(
        session[:query].present? ? Recipe.order(:name).search(session[:query]) : Recipe.order(:name),
        page: 1,
        link_extra: "data-remote='true' data-action='click->recipes#renderRecipes' data-target='recipes.paginationLink'"
      )
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
