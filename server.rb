require 'sinatra'
require 'sinatra/reloader'
require 'pry'

set :bind, '0.0.0.0'

recipes = JSON.parse(File.read('public/data/recipes.json'))

get "/" do
    erb :view
end

get "/recipe/:id" do
    @id = params[:id]
    erb :recipe
end