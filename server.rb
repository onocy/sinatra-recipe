require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative 'models/recipe'

set :bind, '0.0.0.0'

# Import data from JSON file as JSON object 
recipes_json = JSON.parse(File.read('public/data/recipes.json'))

# Create an Array<Recipe> from recipe object with index as ID
recipes = recipes_json.map.with_index {|recipe, index| Recipe.new(index, *recipe.values)}

get "/" do
    redirect("/recipes")
end

get "/recipes" do
    @recipes = recipes.map {|recipe| {id: recipe.id, name: recipe.name, description: recipe.description, author: recipe.author, ingredient_count: recipe.ingredients_count, method_count: recipe.method_count}}[0..20]
    erb :recipes
end

get "/recipe/:id" do
    @recipe = recipes.find {|recipe| recipe.id == params[:id].to_i}
    erb :recipe
end