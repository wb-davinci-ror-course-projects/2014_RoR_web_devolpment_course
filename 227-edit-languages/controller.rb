require './davinci-sinatra.rb'

get "/" do
  @languages = Language.order(:id)
  halt erb(:index)
end

get "/languages/:id" do
  id         = params["id"]
  @language  = Language.find(id)
  halt erb(:edit)
end

# TODO: write a POST handler
