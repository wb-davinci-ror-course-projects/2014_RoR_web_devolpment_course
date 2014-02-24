require './davinci-sinatra.rb'

get "/" do
  @message = Message.all
  halt erb(:index)
end

post "/" do
  message    = Message.new
  message.subject = params["subject"]
  message.body    =params["body"]
  message.save!
  redirect "/"
end
