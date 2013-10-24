require './davinci-sinatra.rb'

get "/" do
  @presidents = President.order(:id)
  halt erb(:index)
end

get "/presidents/:id" do
  id = params["id"]
  @president = President.find(id)
  halt erb(:edit)
end

# TODO: write POST handler to update president
