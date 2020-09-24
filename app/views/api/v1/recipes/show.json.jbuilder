json.recipe ApplicationController.render(partial: 'recipes/recipe', locals: { recipe: @recipe })
json.name @recipe.name
json.id @recipe.id
