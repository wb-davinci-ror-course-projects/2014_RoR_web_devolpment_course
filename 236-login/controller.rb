require './davinci-sinatra.rb'

get "/" do
  halt erb(:login)
end

post '/' do
  
  user = nil
  if user == nil
  @error = "unknown user"
  @old_username = params[:username]
  @old_pin_number = params[:pin_number]
  halt erb(:login)

  elsif User.find_by(username: params["username"]) != nil
  redirect "/success"
  
  end
end

get "/success" do
  halt erb(:success)
end 



