require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/elements/:e" do
  id = params[:e]
  @element = Element.find(id)
  halt erb(:show)
end

