require './davinci-sinatra.rb'

get "/" do
  @recipes = Recipe.order(:id).all
  @title = "All recipes"
  @author = Author.order(:id).each
  halt erb(:index)
end

get "/recipe/:name" do
  name = params["name"]
  @recipe = Recipe.find_by(name: name)
  halt erb(:show)
end

get "/by_author/:first_name" do
  first_name = params["first_name"]
  @by_author = Author.find_by(first_name: first_name)
  @recipes = Recipe.order(:id)
  @title = "Recipes by #{first_name}"
  halt erb(:index)
end

# Add handler for routes like GET /by-author/Jim and GET /by-author/Jen
