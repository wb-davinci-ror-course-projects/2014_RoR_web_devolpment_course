require './davinci-sinatra.rb'

get "/" do
  @customer = Customer.find(1)

  halt erb(:intro)
end

get "/sign_up" do
  @customer = Customer.find(1)

  halt erb(:sign_up)
end

post "/sign_up" do
  @customer = Customer.find(1)
  @customer.first_name = params[:first_name]
  @customer.last_name = params[:last_name]
  if params[:commit] == "Continue"
    if @customer.save == true
      redirect "/shipping"
    else
      halt erb(:sign_up)
    end
  elsif params[:commit] == "Go back"
    redirect "/sign_up"  
  end
end

get "/shipping" do
  @customer = Customer.find(1)
  @u_s_states = USState.order(:name).all
  
  halt erb(:shipping)
end

post "/shipping" do
  @customer = Customer.find(1)
  @u_s_states = USState.order(:name).all
  @customer.ship_address1   = params[:ship_address1]
  @customer.ship_city = params[:ship_city]
  @customer.ship_state = params[:ship_state]
  @customer.ship_speed = params[:ship_speed]
  @customer.ship_zip_code = params[:ship_zip_code]
  if params[:commit] == "Continue"
    if @customer.save == true
      redirect "/billing"
    else
      halt erb(:shipping)
    end
  elsif params[:commit] == "Go back"
    redirect "/shipping"  
  end
end

get "/billing" do
  @customer = Customer.find(1)
  @u_s_states = USState.order(:name).all

  halt erb(:billing)
end

post "/billing" do
  @customer = Customer.find(1)
  @u_s_states = USState.order(:name).all
  @customer.bill_address_same_as_ship = params[:bill_address_same_as_ship]
  if @customer.bill_address_same_as_ship == true
    @customer.bill_address1   = @customer.ship_address1 
    @customer.bill_city = @customer.ship_city
    @customer.bill_state = @customer.ship_state
    @customer.bill_zip_code = @customer.ship_zip_code
    @customer.save
    redirect "/review"
  if @customer.bill_address_same_as_ship != true
    false
  end  
  end
    @customer.bill_address1   = params[:bill_address1]
    @customer.bill_city = params[:bill_city]
    @customer.bill_state = params[:bill_state]
    @customer.bill_zip_code = params[:bill_zip_code]
  
  if params[:commit] == "Continue"
    if @customer.save == true
      redirect "/review"
    else
      halt erb(:billing)
    end
  elsif params[:commit] == "Go back"
    redirect "/billing"  
  end
end

get "/review" do
  @customer = Customer.find(1)

  halt erb(:review)
end

post "/review" do
  @customer = Customer.find(1)

  # TODO: If Go Back was clicked, go back to the previous page
  # TODO: If Place Order was clicked, go to thank_you page
end

get "/thank_you" do
  halt erb(:thank_you)
end
