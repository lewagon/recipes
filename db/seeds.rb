if Rails.env.development?
  puts 'cleanup DB...'
  Recipe.destroy_all
  puts 'DB cleaned.'
end

puts 'Creating recipes...'

url = "https://api.spoonacular.com/recipes/random?apiKey=#{Rails.application.credentials.spoonacular_api_key}&number=#{Recipe::NUMBER}"

response = JSON.parse(RestClient.get url, content_type: :json)

recipes = response['recipes']

recipes.each do |recipe|
  puts "Creating #{recipe['title']}"
  last_recipe = Recipe.create!(
    name: recipe['title'],
    description: recipe['summary'],
    price: recipe['cheap'] ? :cheap : [:medium, :expensive].sample,
    difficulty: [:very_easy, :easy, :moderate, :hard, :very_hard].sample,
    cooktime: recipe['cookingMinutes'] || recipe['readyInMinutes'] || rand(10..120),
    vegetarian: recipe['vegetarian'] || false,
    vegan: recipe['vegan'] || false,
    gluten_free: recipe['glutenFree'] || false,
    healthy: recipe['veryHealthy'] || false,
    image_url: recipe['image']
  )

  recipe['extendedIngredients'].each do |ingredient|
    Ingredient.create!(
      name: ingredient['original'],
      image_url: "https://spoonacular.com/cdn/ingredients_250x250/#{ingredient['image']}",
      recipe: last_recipe
    )
  end

  recipe['cuisines'].each do |cuisine|
    cuisine = Cuisine.find_or_create_by(name: cuisine)
    RecipeCuisine.create! recipe: last_recipe, cuisine: cuisine
  end
end

puts "Recipes created."
