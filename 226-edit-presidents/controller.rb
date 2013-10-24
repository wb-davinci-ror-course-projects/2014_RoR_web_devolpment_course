require './davinci-sinatra.rb'

get "/" do
  @presidents = President.order(:id)
  halt erb(:index)
end
