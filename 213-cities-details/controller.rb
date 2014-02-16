require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/world_cities/:id" do
id = params[:id]
@city = WorldCity.find(id)
halt erb(:show)
end

