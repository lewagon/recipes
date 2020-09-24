json.recipe ApplicationController.render(partial: 'recipes/recipe', locals: { recipe: @recipe, session: session })
json.name @recipe.name
json.id @recipe.id
