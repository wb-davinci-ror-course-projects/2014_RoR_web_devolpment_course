require './davinci-sinatra.rb'

get "/" do
  @entries = EncyclopediaEntry.order(:word)
  halt erb(:index)
end

get "/:word" do
  w = params[:word]
  @entry = EncyclopediaEntry.find_by(word: w)
  halt erb(:show)
end


 