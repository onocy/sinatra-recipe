require 'sinatra'
require 'sinatra/reloader'
require 'pry'

set :bind, '0.0.0.0'

get "/" do
    erb :view
end

get "/recipe/:id" do
    @id = params[:id]
    erb :recipe
end