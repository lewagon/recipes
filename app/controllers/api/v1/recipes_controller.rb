class Api::V1::RecipesController < Api::V1::BaseController
  def index
    query = params.dig(:search, :query)
    session[:query] = query.present? ? query : nil
    @pagy, @recipes = pagy(
      session[:query].present? ? Recipe.search(session[:query]) : Recipe.all,
      link_extra: "data-remote='true' data-action='click->recipes#renderRecipes' data-target='recipes.paginationLink'"
    )
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
