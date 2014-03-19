class MainController < ApplicationController

def action_home
  render :login and return
end 

def action_login
  @error = nil
  render :login and return
end 

def action_login_post
  attempted_username = params["username"]
  attempted_password = params["password"]

  @member = Member.find_by(username: attempted_username)

  if @member == nil
    flash.now[:error] = "Unknown username"
    render :login and return
  elsif @member.authenticate(attempted_password) == false
    flash.now[:error] = "Incorrect password"
    render :login and return
  else
    session[:member_id] = @member.id
    redirect "/"
    #redirect "/reservations"
  end
end
  
end
