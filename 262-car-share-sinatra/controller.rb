require './davinci-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do
  halt erb(:login)
end

post "/login" do
  attempted_username = params["username"]
  attempted_password = params["password"]

  @member = Member.find_by(username: attempted_username)

  if @member == nil
    flash.now[:error] = "Unknown username"
    halt erb(:login)
  elsif @member.authenticate(attempted_password) == false
    flash.now[:error] = "Incorrect password"
    halt erb(:login)
  else
    session[:member_id] = @member.id
    redirect "/reservations"
  end
end

get "/reservations" do
  member_id = session[:member_id]
  @member = Member.find(member_id)
  @reserved_cars = @member.cars
  halt erb(:reservations)
end

post "/reservations" do
  member_id = session[:member_id]
  member = Member.find(member_id)

  if params["commit"] == "Logout"
    redirect "/login"
  end

  Car.all.each do |car|
    if params["commit"] == "Return car #{car.id}"
      car.member_id = nil
      car.save!
    end
  end

  Car.all.each do |car|
    if params["commit"] == "Reserve car #{car.id}"
      car.member_id = member_id
      car.save!
    end
  end

  redirect "/reservations"
end
