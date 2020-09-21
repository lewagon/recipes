module RecipeHelper
  def difficulty(recipe)
    if recipe.very_easy? || recipe.easy?
      klass = 'mdi mdi-thumb-up mr-1'
    elsif recipe.moderate?
      klass = 'mdi mdi-tilde mr-1'
    else
      klass = 'mdi mdi-thumb-down mr-1'
    end
    content_tag :i, '', class: klass
  end
end
