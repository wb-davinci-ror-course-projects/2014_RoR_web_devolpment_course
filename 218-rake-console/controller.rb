require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/elements/:id" do
  id = params[:id]
  @element = Element.find(id)
  halt erb(:show_element)
end

get "/cities/:id" do
  id = params[:id]
  @city = WorldCity.find(id)
  halt erb(:show_city)
end

get "/create_element" do
Element.create! name: "Carbon"
  halt erb(:index)
end

get "/add_population/" do
  w = WorldCity.find(2)
  w.population_in_millions= w.population_in_millions * 2
  WorldCity.create! population_in_millions: w
  w.save!
  halt erb(:index)
end

