require './davinci-sinatra.rb'

get "/" do
  halt erb(:enter_first)
end


post "/" do

  first_name = params["first_name"]
  @person = Person.where(first_name: first_name)

  if @person.size == 0
  halt erb(:no_one)

  elsif @person.size == 1
  @person = Person.find_by(first_name: first_name)
  halt erb (:number)

  elsif @person.size > 1
  @people = Person.where(first_name: first_name)
  halt erb(:choose)

end
end








get "/person/:first/:last" do
  first = params[:first]
  last = params[:last]
  @person = Person.find_by(first_name: first, last_name: last)
  halt erb(:number)
end






# post "/" do
#   first_name = params["first_name"]
#   people = Person.where(first_name: first_name)
#   if people.size == 0
#     halt erb(:no_one)
#   elsif people.size >1
#     @people = people
#     halt erb(:choose)
#   else
#     @person = Person.find_by(first_name: first_name)
#       halt erb(:number)
#   end
# end 
