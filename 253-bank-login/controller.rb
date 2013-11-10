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
  # TODO: Take the username and password that the user entered,
  # and either log them in, saving their user ID to the session,
  # and redirect to /accounts, or set an error message in @error
  # and re-render login.html.erb.
end

get "/accounts" do
  # TODO: Load the user based on the id saved to the session

  halt erb(:accounts)
end

get "/location" do
  # TODO: Load the user based on the id saved to the session

  halt erb(:location)
end

get "/rates" do
  # TODO: Load the user based on the id saved to the session

  halt erb(:rates)
end

# TODO: Write handler for GET /logout that logs out the user
