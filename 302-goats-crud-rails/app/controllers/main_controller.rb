class MainController < ApplicationController

def action_home
  @goats = RacingGoat.all
  render :index and return
end

def action_new_goat
    @goat = RacingGoat.new
  render :edit and return
end

def action_new_goat_post
  @goat                    = RacingGoat.new
  @goat.name               = params["name"]
  @goat.gender             = params["gender"]
  @goat.best_100m_time     = params["best_100m_time"]
  @goat.dietary_preference = params["dietary_preference"]
  if @goat.save == true
    flash[:notice] = "Record has been created."
    redirect_to "/" and return
  else
    render :edit and return
  end 
end 

def action_goats_id
  id = params["id"]
  @goat = RacingGoat.find(id)
  render :edit and return
end

def action_goats_id_post
  id = params["id"]
  @goat = RacingGoat.find(id)
  if params["commit"] == "Save"
    @goat.name               = params["name"]
    @goat.gender             = params["gender"]
    @goat.best_100m_time     = params["best_100m_time"]
    @goat.dietary_preference = params["dietary_preference"]
    if @goat.save == true
      flash[:notice] = "Record has been updated."
      redirect_to "/" and return
    else 
      render :edit
    end 
  elsif params["commit"] == "Delete"
    @goat.destroy
    flash[:notice] = "Record has been deleted."
    redirect_to "/" and return
  end
end
end
