require './davinci-sinatra.rb'

get "/" do
  @cars = Car.order(:id)
  @member = Member.order(:id)
  halt erb(:index)
end
