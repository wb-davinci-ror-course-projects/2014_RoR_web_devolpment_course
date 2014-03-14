require './davinci-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/users/new" do
  @user = User.new
  halt erb(:new)
end

post "/users/new" do
  @user = User.new
  @user.username = params[:username]
  @user.password = params[:password]
  @user.password_confirmation = params[:password_confirmation]
  if @user.save != true
     @message = "Please fill out all fields and make sure your passwords match."
     halt erb(:new)
     else 
      halt erb(:welcome)
  end
end

get "/login" do
  halt erb(:login)
end

post "/login" do
  username = params[:username]
  attempted_password = params[:password]
  user = User.find_by(username: username)
    if user == nil
      @message = "Username not found"
      halt erb(:login)
      elsif user.authenticate(attempted_password) == false
        @message = "Password is incorrect"
        halt erb(:login)
    else
      session[:user_id] = user.id
      redirect "/welcome"
    end
end

get "/welcome" do
  user_id = session[:user_id]
  @user = User.find(user_id)
  halt erb(:welcome)
end

get "/logout" do
  session.clear
  redirect "/"
end


