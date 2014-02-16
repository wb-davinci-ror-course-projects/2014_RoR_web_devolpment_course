require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

get"/ufo_sightings/:u" do
id = params[:u]
@sighting = UfoSighting.find(id)
halt erb(:show)
end
