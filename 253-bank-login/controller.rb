require './davinci-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do
  @error = nil
  halt erb(:login)
end

post "/login" do
  username = params["username"]
  user = User.find_by(username: username)
    if user == nil
      @error = "Unknown username"
      halt erb(:login)
    else
      session[:user_id] = user.id
      redirect "accounts"
      end
    end

get "/accounts" do
  @user = User.find_by(id: session[:user_id])
  halt erb(:accounts)
end

get "/location" do
  @user = User.find_by(id: session[:user_id])
  halt erb(:location)
end

get "/rates" do
  @user = User.find_by(id: session[:user_id])
  halt erb(:rates)
end

# TODO: Write handler for GET /logout that logs out the user
