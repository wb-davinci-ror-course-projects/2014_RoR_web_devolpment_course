require './davinci-sinatra.rb'

get "/" do
  @patients = Patient.order(:id)
  halt erb(:index)
end


get "/patients/:id" do
  id       = params["id"]
  @patient = Patient.find(id)
  halt erb(:edit)
end


post "/patients/:id" do
  id          =params["id"]
  @info    =Patient.find(id)
  @info.systolic =params["systolic"]
  @info.diastolic  =params["diastolic"]
  @info.save!
  redirect "/"
end




