require './davinci-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do
  # There's no error to show; not necessary, just being clear...
  @error = nil

  halt erb(:login)
end

post "/login" do
  # Load the values that user filled out for the username and password
  # into variables.
  username = params["username"]
  password = params["password"]
  password_confirmation = params["password_confirmation"]
 
  # Look for a row in the users table with that same username
  found_user = User.find_by(username: username)

  # If no row was found for that username...
  if found_user == nil
    # Then set a message to show at the top of the page
    @error = "Unknown username"
    halt erb(:login)
  end
  
  attempted_password = params["password"]
  if found_user.authenticate(attempted_password) != false
        session[:user_id] = found_user.id
          redirect "/accounts"
    else
      @error = "Incorrect password"
      halt erb(:login)
  end # End if
end # End handler

get "/accounts" do
  # Load the user based on the id saved to the session
  @user = User.find_by(id: session[:user_id])

  halt erb(:accounts)
end

get "/location" do
  # Load the user based on the id saved to the session
  @user = User.find_by(id: session[:user_id])

  halt erb(:location)
end

get "/rates" do
  # Load the user based on the id saved to the session
  @user = User.find_by(id: session[:user_id])

  halt erb(:rates)
end

get "/logout" do
  # Throw away the user id saved in the session
  session.clear

  redirect "/login"
end
