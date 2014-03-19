require './davinci-sinatra.rb'

get "/" do
  @goats = RacingGoat.all
  halt erb(:index)
end

get "/new_goat" do
  @goat = RacingGoat.new
  halt erb(:edit)
end

post "/new_goat" do
  @goat = RacingGoat.new
  @goat.name = params[:name]
  @goat.gender = params[:gender]
  @goat.best_100m_time = params[:best_100m_time]
  @goat.dietary_preference = params[:dietary_preference]
  if @goat.save == false
    flash.now[:error] = "Name and gender fields are required."
    halt erb(:edit)
  else
    redirect "/"
  end
end

get "/goats/:id" do
  id = params[:id]
  @goat = RacingGoat.find(id)
  halt erb(:edit)
end

post "/goats/:id" do
  id = params[:id]
  @goat = RacingGoat.find_by(id: id)
  @goat.name = params[:name]
  @goat.gender = params[:gender]
  @goat.best_100m_time = params[:best_100m_time]
  @goat.dietary_preference = params[:dietary_preference]
  if @goat.save == false
    flash.now[:error] = "Name and gender fields are required."
    halt erb(:edit)
  else
    redirect "/"
  end
end