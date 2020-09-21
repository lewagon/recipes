module RecipeHelper
  def difficulty(recipe)
    if recipe.very_easy? || recipe.easy?
      klass = 'mdi mdi-thumb-up'
    elsif recipe.moderate?
      klass = 'mdi mdi-tilde'
    else
      klass = 'mdi mdi-thumb-down'
    end
    content_tag :i, '', class: klass
  end
end
