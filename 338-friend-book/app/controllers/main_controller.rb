class MainController < ApplicationController

def index
  render :index and return 
end

def show 
  render :show and return 
end

def show_post
  session[:character_id] = params[:id]
  user = Person.find_by(id: session[:character_id])
  if user == nil
    flash[:error] = "Username not found"
    redirect_to "/" and return
  elsif user.authenticate(params[:password]) == false
    flash[:error] = "The password entered is incorrect"
    redirect_to "/" and return  
  else
    redirect_to "/show" and return
  end
end

def new_leader
  new_leader = Following.new
  new_leader.to_person_id = params[:id]
  new_leader.from_person_id = session[:character_id]
  new_leader.save!
  redirect_to "/" and return 
end

def logout
  session.clear
  redirect_to "/" and return 
end

end
