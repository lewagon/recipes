json.recipes ApplicationController.render(partial: 'recipes/recipes', locals: { recipes: @recipes, pagy: @pagy, remote: true })
json.last_page @pagy.last
