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

  # Look for a row in the users table with that same username
  found_user = User.find_by(username: username)

  # If no row was found for that username...
  if found_user == nil
    # TODO: Change this to a flash message, so it survives the redirect
    @error = "Unknown username"

    halt erb(:login) # TODO: Change this to redirect instead of rendering

  # Otherwise, if the password was wrong...
  elsif found_user.authenticate(password) == false
    # TODO: Change this to a flash message, so it survives the redirect
    @error = "Incorrect password"

    halt erb(:login) # TODO: Change this to redirect instead of rendering

  # Otherwise... (if the username and password was right)
  else
    # Save that user's id into the session so we'll have it later
    session[:user_id] = found_user.id

    # TODO: Tell the user "You have successfully logged in" once after login.

    # Redirect to the default page
    redirect "/welcome"
  end # End if
end # End handler

get "/welcome" do
  # Load the user_id from the session
  user_id = session[:user_id]
  # Load the user based on that id saved to the session
  @user = User.find(user_id)
  halt erb(:welcome)
end

get "/logout" do
  # Remove the user id from the session and everything else
  session.clear

  # TODO: Tell the user "You have successfully logged out" once after logout.

  redirect "/login"
end
