class TaskingController < ApplicationController

  def login
    render :index and return
  end

  def create
    username = params[:username]
    password = params[:password]
    admin    = Admin.where(username: username).first

    if admin == nil
      flash.now[:error] = "Unknown username"
      render :index and return
    elsif admin.authenticate(password) == false
      flash.now[:error] = "Wrong password"
      render :index and return
    else 
      session[:admin_id] = admin.id
      redirect_to "/changes" and return
    end
  end

  def logout
    session.clear
    redirect_to "/tasking" and return
  end

end
