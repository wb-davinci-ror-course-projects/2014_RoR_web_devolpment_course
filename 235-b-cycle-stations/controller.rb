require './davinci-sinatra.rb'

get "/" do
  @stations = Station.order(:id)
  halt erb(:index)
end

get "/existing" do
  @stations = Station.where(status: "existing")
  halt erb(:index)
end

get "/private" do
  @stations = Station.where(property_type: "private")
  halt erb(:index)
end

get "/zip/:zip_code" do 
  x = params["zip_code"]
  @stations = Station.where(zip_code: x)
  halt erb(:index)
end

get "/street/Broadway" do
  substring = params["substring"]
  @stations = Station.where("address1 ilike ?", "%Broadway%")
  halt erb(:index)
end  

get "/street/17th" do
  substring = params["substring"]
  @stations = Station.where("address1 ilike ?", "%17th%")
  halt erb(:index)
end

