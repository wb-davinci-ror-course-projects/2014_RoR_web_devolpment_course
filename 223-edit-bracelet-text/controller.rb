require './davinci-sinatra.rb'

get "/" do
  @lines = BraceletLine.order(:id)
  halt erb(:index)
end

get "/lines/:id" do
  id = params["id"]
  @line = BraceletLine.find(id)
  halt erb(:edit)
end

post "/lines/:id" do
  id      =params["id"]
  @new    =BraceletLine.find(id)
  @new.font_size    =params["font_size"]
  @new.text         =params["text"]
  @new.save!        
  redirect "/"
end