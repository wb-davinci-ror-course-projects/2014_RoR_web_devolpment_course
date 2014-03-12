require './davinci-sinatra.rb'

get "/" do
  @favorite_color = session[:favorite_color]
  @favorite_letter = session[:favorite_letter]
  @favorite_number = session[:favorite_number] 
  # TODO: Retrieve three values stored in the session and use them
  # to pre-fill form values in the view.

  halt erb(:index)
end

post "/" do
  favorite_color = params[:favorite_color]
  favorite_letter = params[:favorite_letter]
  favorite_number = params[:favorite_number]
  session[:favorite_color] = favorite_color
  session[:favorite_letter] = favorite_letter
  session[:favorite_number] = favorite_number
  
  
  # TODO: Transfer values of POST params to become local variables.
  # TODO: Save those local variables to the session so the values
  #       will last.

  halt erb(:index)
end

get "/logout" do
  session.clear
  redirect "/"
end
