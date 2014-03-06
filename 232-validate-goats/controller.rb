require './davinci-sinatra.rb'

get "/" do
  @goats = RacingGoat.all
  halt erb(:index)
end

post "/edit" do
  @goat                    = RacingGoat.new
  @goat.name               = params["name"]
  @goat.gender             = params["gender"]
  @goat.best_100m_time     = params["best_100m_time"]
  @goat.dietary_preference = params["dietary_preference"]
  if @goat.save == true
    redirect "/"
  else
    halt erb(:edit)
  end
end

get "/goats/:id" do
  id = params["id"]
  @goat = RacingGoat.find(id)
  halt erb(:edit)
end

post "/goats/:id" do
  id = params["id"]
  @goat = RacingGoat.find(id)
  @goat.name               = params["name"]
  @goat.gender             = params["gender"]
  @goat.best_100m_time     = params["best_100m_time"]
  @goat.dietary_preference = params["dietary_preference"]
  @goat.save!
  redirect "/"
end
